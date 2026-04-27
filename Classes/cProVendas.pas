unit cProVendas;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,uEnum,
     Datasnap.DBClient, cControleEstoque;

type
  TVenda = class
  private
    ConexaoDB:TFDConnection;
    F_vendaId:Integer;
    F_clienteId:Integer;
    F_dataValidade: TDateTime;
    F_dataVenda:TDateTime;
    F_totalVenda: Double;
    function InserirItens(cds: TClientDataSet; IdVenda: Integer): Boolean;
    function ApagarItens(cds: TClientDataSet): Boolean;
    function InNot(cds: TClientDataset): string;
    function EsteItemExiste(vendaId, produtoId: Integer): Boolean;
    function AtualizarItem(cds: TClientDataSet): Boolean;
    procedure RetornarEstoque(sCodigo: string; Acao: TAcaoExcluirEstoque);
    procedure BaixarEstoque(produtoId: Integer; Quantidade: Double);
    procedure InserirPreVendaItens(Qry: TFDQuery; cds: TClientDataSet);


  public
    constructor Create(aConexao:TFDConnection);
    destructor  Destroy; override;
    function Inserir(cds:TClientDataSet):Integer;
    function Atualizar(cds:TClientDataSet):Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer; var cds:TClientDataSet):Boolean;
    function InserirPreVenda(cds: TClientDataSet): Boolean;
    function ApagarPreVenda(aPrevendaId: Integer): Boolean;
    function SelecionarPreVenda(id: Integer; var cds: TClientDataSet): Boolean;
    function AtualizarPreVenda(cds:TClientDataSet):Boolean;

  published
    property VendaId:Integer        read F_vendaId        write F_vendaId;
    property ClienteId:Integer      read F_clienteId      write F_clienteId;
    property DataVenda:TDateTime    read F_dataVenda      write F_dataVenda;
    property DataValidade:TDateTime read F_dataValidade   write F_dataValidade;
    property TotalVenda:Double      read F_totalVenda     write F_totalVenda;
  end;

implementation

{ TVenda }

{$REGION 'Constructor e Destructor'}
constructor TVenda.Create(aConexao: TFDConnection);
begin
   ConexaoDB:=aConexao;
end;

destructor TVenda.Destroy;
begin

  inherited;
end;
{$ENDREGION}

{$REGION 'Métodos CRUD'}
function TVenda.Apagar:Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Venda Nro: '+IntToStr(VendaId),mtConfirmation,[mbYes, mbNo],0)=mrNo then begin //ou F_vendaId?
     Result:=False;
     Abort;
  end;

  try
    Result:=True;
    ConexaoDB.StartTransaction;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    //Apaga os Itens Primeiro
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM vendasItens '+
                ' WHERE vendaId=:vendaId ');
    Qry.ParamByName('vendaId').AsInteger :=VendaId;
    try
      Qry.ExecSQL;
      //Apaga a Tabela Master
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM vendas '+
                  ' WHERE vendaId=:vendaId ');
      Qry.ParamByName('vendaId').AsInteger :=VendaId;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TVenda.Atualizar(cds:TClientDataSet):Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    ConexaoDB.StartTransaction;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Vendas '+
                '   SET clienteId=:clienteId '+
                '      ,dataVenda=:dataVenda '+
                '      ,totalVenda=:totalVenda '+
                ' WHERE vendaId=:vendaId ');
    Qry.ParamByName('vendaId').AsInteger        :=Self.F_vendaId;
    Qry.ParamByName('clienteId').AsInteger      :=Self.F_clienteId;
    Qry.ParamByName('dataVenda').AsDateTime     :=Self.F_dataVenda;
    Qry.ParamByName('totalVenda').AsFloat       :=Self.F_totalVenda;

    try
      //Update Vendas
      Qry.ExecSQL;

      //Apagar Itens do Banco de Dados que foram apagados na Tela
      ApagarItens(cds);

      cds.First;
      while not cds.Eof do begin
        if EsteItemExiste(Self.F_vendaId, cds.FieldByName('produtoId').AsInteger) then begin
          //Update
          AtualizarItem(cds);
        end
        else begin
          //Insert
          InserirItens(cds, Self.F_vendaId);
        end;
        cds.Next;
      end;
      ConexaoDB.Commit;
    except
      Result:=False;
      ConexaoDB.Rollback;
    end;

  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TVenda.AtualizarItem(cds:TClientDataSet):Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=true;
    RetornarEstoque(cds.FieldByName('produtoId').AsString, aeeAlterar);
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE vendasItens '+
                '   SET valorUnitario=:valorUnitario '+
                '       ,quantidade=:quantidade '+
                '       ,totalProduto=:totalProduto '+
                '  WHERE vendaId=:vendaId AND produtoId=:produtoId ');
    Qry.ParamByName('vendaId').AsInteger      :=Self.F_vendaId;
    Qry.ParamByName('produtoId').AsInteger    :=cds.FieldByName('produtoId').AsInteger;
    Qry.ParamByName('valorUnitario').AsFloat  :=cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('quantidade').AsFloat     :=cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('totalProduto').AsFloat   :=cds.FieldByName('valorTotalProduto').AsFloat;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TVenda.ApagarItens(cds:TClientDataSet):Boolean;
var Qry:TFDQuery;
    sCodNoCds:string;
begin
  try
    Result:=True;
    //Pega os codigos que estão no Cliente para Selecionar o In Not no Banco de Dados
    sCodNoCds:= InNot(cds);

    //Retorna ao Estoque
    RetornarEstoque(sCodNoCds, aeeApagar);

    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' DELETE '+
                '   FROM vendasItens '+
                '  WHERE vendaId=:vendaId '+
                '    AND produtoId NOT IN ('+sCodNoCds+') ');
    Qry.ParamByName('vendaId').AsInteger    :=Self.F_vendaId;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TVenda.InNot(cds:TClientDataset):string;
var sInNot:string;
begin
  sInNot:=EmptyStr;
  cds.First;
  while not cds.Eof do begin
    if sInNot=EmptyStr then
       sInNot := cds.FieldByName('produtoId').AsString
    else
       sInNot := sInNot +','+cds.FieldByName('produtoId').AsString;

    cds.Next;
  end;
  Result:=sInNot;
end;

function TVenda.EsteItemExiste(vendaId: Integer; produtoId:Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT Count(vendaId) AS Qtde ' +
                '  FROM vendasItens '+
                ' WHERE vendaId=:vendaId AND produtoId=:produtoId ');
    Qry.ParamByName('vendaId').AsInteger    :=vendaId;
    Qry.ParamByName('produtoId').AsInteger  :=produtoId;
    try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         Result:=True
      else
         Result:=False;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

function TVenda.InserirItens(cds:TClientDataSet; IdVenda:Integer):Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO VendasItens ( VendaID, ProdutoID, ValorUnitario, Quantidade, TotalProduto) '+
                '                 VALUES (:VendaID,:ProdutoID,:ValorUnitario,:Quantidade,:TotalProduto) ');

    Qry.ParamByName('VendaID').AsInteger        := IdVenda;
    Qry.ParamByName('ProdutoID').AsInteger      := cds.FieldByName('produtoId').AsInteger;
    Qry.ParamByName('ValorUnitario').AsFloat    := cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('Quantidade').AsFloat       := cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('TotalProduto').AsFloat     := cds.FieldByName('valorTotalProduto').AsFloat;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
      BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function  TVenda.Inserir(cds:TClientDataSet):Integer ;
var Qry:TFDQuery;
    IdVendaGerado:Integer;
begin
  try
    conexaoDB.StartTransaction;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:= ConexaoDB;

    Qry.SQL.Clear;
    Qry.SQL.Add('insert into vendas (clienteId, dataVenda, totalVenda) '+
                'output inserted.vendaId '+
                'values (:clienteId,:dataVenda,:totalVenda)');

    Qry.ParamByName('clienteId').AsInteger  := Self.F_ClienteId;
    Qry.ParamByName('dataVenda').AsDateTime := Self.F_DataVenda;
    Qry.ParamByName('totalVenda').AsFloat   := Self.F_totalVenda;

    Qry.Open;

    IdVendaGerado := Qry.FieldByName('vendaId').AsInteger;

        {$REGION 'Gravar na tabela VendasItnes'}
        cds.First;
        while not cds.Eof do begin
          InserirItens(cds, IdVendaGerado);
        cds.Next;
        end;

        {$ENDREGION}
    try
        conexaoDB.Commit;
        Result:=IdVendaGerado;
      except
        conexaoDB.Rollback;
        Result:=-1;
      end;

  finally
    if Assigned (Qry) then
    FreeAndNil (Qry);
  end;
end;


function TVenda.Selecionar(id: Integer; var cds:TClientDataSet): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT vendaId '+
                '      ,clienteId '+
                '      ,dataVenda '+
                '      ,totalVenda '+
                '  FROM Vendas '+
                ' WHERE vendaId=:vendaId');
    Qry.ParamByName('vendaId').AsInteger:=id;
    try
      Qry.Open;

      Self.F_vendaId      :=Qry.FieldByName('vendaId').AsInteger;
      Self.F_clienteId    :=Qry.FieldByName('clienteId').AsInteger;
      Self.F_dataVenda    :=Qry.FieldByName('dataVenda').AsDateTime;
      Self.F_totalVenda   :=Qry.FieldByName('totalVenda').AsFloat;

      {$REGION 'SELECIONAR na tabela VendasItens'}
      //Apaga o ClientDataSet Caso esteja com Registro
      cds.First;
      while not cds.Eof do begin
        cds.Delete;
      end;

      //Seleciona os Itens do Banco de Dados com a propriedade F_VendaId
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT vendasItens.produtoId, ' +   //Talvez deixar igual o do prof
                  '       produtos.nome, '+
                  '       vendasItens.valorUnitario, '+
                  '       vendasItens.quantidade, '+
                  '       vendasItens.totalProduto '+
                  '  FROM vendasItens '+
                  '       INNER JOIN produtos On produtos.produtoId = vendasItens.produtoId '+
                  ' WHERE vendasItens.vendaId=:vendaId ');
      Qry.ParamByName('vendaId').AsInteger := Self.F_vendaId;
      Qry.Open;

      //Lê da Qery e Coloca no ClientDataSet
      Qry.First;
      while not Qry.Eof do begin
        cds.Append;
        cds.FieldByName('produtoId').AsInteger          := Qry.FieldByName('produtoId').AsInteger;
        cds.FieldByName('nomeProduto').AsString         := Qry.FieldByName('nome').AsString;
        cds.FieldByName('valorUnitario').AsFloat        := Qry.FieldByName('valorUnitario').AsFloat;
        cds.FieldByName('quantidade').AsFloat           := Qry.FieldByName('quantidade').AsFloat;
        cds.FieldByName('valorTotalProduto').AsFloat    := Qry.FieldByName('totalProduto').AsFloat; //Talvez valorTotalProduto
        cds.Post;
        Qry.Next;
      end;
      cds.First;
      {$ENDREGION}

    except
      Result:=false;
    end;

  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

{$REGION 'Pré-Venda'}
function TVenda.InserirPreVenda(cds: TClientDataSet): Boolean;
var
  Qry: TFDQuery;
begin
  Result := True;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := ConexaoDB;
    ConexaoDB.StartTransaction;
    try
      // GRAVAR PRÉ-VENDA
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO preVenda (clienteId, dataEmissao, dataValidade, totalVenda, status) ');
      Qry.SQL.Add('OUTPUT INSERTED.preVendaId '); // O SQL Server devolve o ID gerado instantaneamente
      Qry.SQL.Add('VALUES (:clienteId, GETDATE(), :totalVenda, ''PENDENTE'')');

      Qry.ParamByName('clienteId').AsInteger := Self.F_clienteId;
      Qry.ParamByName('totalVenda').AsFloat  := Self.F_totalVenda;

      // Open em vez de ExecSQL porque o OUTPUT devolve um resultado (o ID)
      Qry.Open;
      Self.F_vendaId := Qry.FieldByName('preVendaId').AsInteger;
      Qry.Close;

      InserirPreVendaItens(Qry, cds); //Método extraído

      ConexaoDB.Commit; // Tudo correu bem, confirmamos os registos!
    except
      ConexaoDB.Rollback; // Deu erro? Revertemos tudo para não deixar lixo!
      Result := False;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TVenda.ApagarPreVenda(aPrevendaId: Integer): Boolean;
var Qry: TFDQuery;
begin
  Result:=True;
  Qry   :=TFDQuery.Create(nil);
  try
    Qry.Connection:=ConexaoDB;
    ConexaoDB.StartTransaction;
    try
      //Deleta primeiro os itens da Pré-Venda
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM preVendaItens WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPrevendaId;
      Qry.ExecSQL;

      //Deleta a Pré-Venda em si
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM preVenda WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPrevendaId;
      Qry.ExecSQL;

      ConexaoDB.Commit;
    except
      on E: Exception do begin
        ConexaoDB.Rollback;
        ShowMessage('Ocorreu um erro '+ E.Message); //Debug maroto porquê já tive muito erro nessa parte kkkkkk
        Result:= False;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TVenda.SelecionarPreVenda(id: Integer; var cds: TClientDataSet): Boolean;
var Qry:TFDQuery;
begin
  try
    Result         :=True;
    Qry            :=TFDQuery.Create(nil);
    Qry.Connection :=ConexaoDB;

    //Carrega a Pré-Venda
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT preVendaId, clienteId, dataEmissao,dataValidade, totalVenda FROM preVenda WHERE preVendaId = :id');
    Qry.ParamByName('id').AsInteger := id;
    Qry.Open;

    if Qry.IsEmpty then
    begin
      Result := False;
      Exit;
    end;

    Self.F_vendaId      := Qry.FieldByName('preVendaId').AsInteger;
    Self.F_clienteId    := Qry.FieldByName('clienteId').AsInteger;
    Self.F_dataVenda    := Qry.FieldByName('dataEmissao').AsDateTime;
    Self.F_dataValidade := Qry.FieldByName('dataValidade').AsDateTime;
    Self.F_totalVenda   := Qry.FieldByName('totalVenda').AsFloat;

    //Limpa o carrinho da tela
    cds.First;
    while not cds.Eof do
      cds.Delete;

    //Carrega os itens da Pré-Venda(Rascunho)
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT pvi.produtoId, p.nome, pvi.valorUnitario, pvi.quantidade, pvi.totalProduto ');
    Qry.SQL.Add('FROM preVendaItens pvi ');
    Qry.SQL.Add('INNER JOIN produtos p ON p.produtoId = pvi.produtoId ');
    Qry.SQL.Add('WHERE pvi.preVendaId = :id');
    Qry.ParamByName('id'). AsInteger := id;
    Qry.Open;

    //Preenche os Itens
    Qry.First;
    while not Qry.Eof do
    begin
      cds.Append;
      cds.FieldByName('produtoId').AsInteger      :=  Qry.FieldByName('produtoId').AsInteger;
      cds.FieldByName('nomeProduto').AsString     :=  Qry.FieldByName('nome').AsString;
      cds.FieldByName('valorUnitario').AsFloat    :=  Qry.FieldByName('valorUnitario').AsFloat;
      cds.FieldByName('quantidade').AsFloat       :=  Qry.FieldByName('quantidade').AsFloat;
      cds.FieldByName('valorTotalProduto').AsFloat:=  Qry.FieldByName('totalProduto').AsFloat;
      cds.Post;
      Qry.Next;
    end;
    cds.First;

  except
  on E: Exception do
  begin
    ShowMessage('Erro '+ E.Message);
    Result:=False;
  end;

  end;
end;

function TVenda.AtualizarPreVenda(cds: TClientDataSet): Boolean;
var Qry:TFDQuery;
begin
   Result:=True;
   Qry   :=TFDQuery.Create(nil);
  try
    Qry.Connection:= ConexaoDB;
    ConexaoDB.StartTransaction;
    try
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE preVenda SET');
      Qry.SQL.Add('clienteId = :clienteId, ');
      Qry.SQL.Add('totalVenda = :totalVenda ');
      Qry.SQL.Add('WHERE preVendaId = :id');

      Qry.ParamByName('id').AsInteger       :=Self.F_vendaId;
      Qry.ParamByName('clienteId').AsInteger:=Self.F_clienteId;
      Qry.ParamByName('totalVenda').AsFloat :=Self.F_totalVenda;

      Qry.ExecSQL;

      //Apaga e resinsere os itens
      Qry.SQL.Clear;
      Qry.SQL.Add('DELETE FROM preVendaItens WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := Self.F_vendaId;
      Qry.ExecSQL;

      InserirPreVendaItens(Qry, cds);

      ConexaoDB.Commit;
    except
      on E: Exception do
      begin
        ConexaoDB.Rollback;
        ShowMessage('Erro '+ E.Message);
        Result:=False;
      end;

    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TVenda.InserirPreVendaItens(Qry: TFDQuery; cds: TClientDataSet);
begin
  // Gravar os itens da pré Venda
  cds.First;
  while not cds.Eof do
  begin
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO preVendaItens (preVendaId, produtoId, quantidade, valorUnitario, totalProduto) ');
    Qry.SQL.Add('VALUES (:preVendaId, :produtoId, :quantidade, :valorUnitario, :totalProduto)');
    Qry.ParamByName('preVendaId').AsInteger := Self.F_vendaId;
    Qry.ParamByName('produtoId').AsInteger := cds.FieldByName('produtoId').AsInteger;
    Qry.ParamByName('quantidade').AsFloat := cds.FieldByName('quantidade').AsFloat;
    Qry.ParamByName('valorUnitario').AsFloat := cds.FieldByName('valorUnitario').AsFloat;
    Qry.ParamByName('totalProduto').AsFloat := cds.FieldByName('valorTotalProduto').AsFloat;
    Qry.ExecSQL;
    cds.Next;
  end;
end;
{$ENDREGION}

{$REGION 'Controle de Estoque'}
//Utilizar no Update e Delete do Item
procedure TVenda.RetornarEstoque(sCodigo:string; Acao:TAcaoExcluirEstoque);
var Qry:TFDQuery;
    oControleEstoque:TControleEstoque;
begin
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(   ' SELECT produtoId, quantidade '+
                   '   FROM vendasItens '+
                   '  WHERE vendaId=:vendaId ');
    if Acao=aeeApagar then
       Qry.SQL.Add('  AND produtoId NOT IN ('+sCodigo+') ')
    else
       Qry.SQL.Add('  AND produtoId = ('+sCodigo+') ');

    Qry.ParamByName('vendaId').AsInteger      :=Self.F_vendaId;
    try
      oControleEstoque:=TControleEstoque.Create(ConexaoDB);
      Qry.Open;
      Qry.First;
      while not Qry.Eof do begin
        oControleEstoque.ProdutoId    :=Qry.FieldByName('produtoId').AsInteger;
        oControleEstoque.Quantidade   :=Qry.FieldByName('quantidade').AsFloat;
        oControleEstoque.RetornarEstoque;
        Qry.Next;
      end;
    finally
      if Assigned(oControleEstoque) then FreeAndNil(oControleEstoque);
    end;
end;

procedure TVenda.BaixarEstoque(produtoId:Integer; Quantidade:Double);
var oControleEstoque:TControleEstoque;
begin
  try
    oControleEstoque:=TControleEstoque.Create(ConexaoDB);
    oControleEstoque.ProdutoId    :=produtoId;
    oControleEstoque.Quantidade   :=Quantidade;
    oControleEstoque.BaixarEstoque;
  finally
    if Assigned(oControleEstoque) then FreeAndNIl(oControleEstoque);
  end;
end;
{$ENDREGION}
end.
