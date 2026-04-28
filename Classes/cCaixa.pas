unit cCaixa;

interface

uses
  System.Classes, System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  cProVendas, uEnum, Vcl.Dialogs, cControleEstoque;

type
  TCaixa = class

  private
    ConexaoDB:    TFDConnection;
    F_vendaId:    Integer;
    F_valorTotal: Double;

  public
    constructor Create(aConexao: TFDConnection);

    function FaturarVenda(aPreVendaId: Integer): Boolean;
    function CancelarPreVenda(aPreVendaId: Integer): Boolean;
    function ExtornarVenda(aPreVendaId: Integer): Boolean;

  published
    property VendaId:Integer        read F_vendaId        write F_vendaId;
  end;

implementation

{ TCaixa }


constructor TCaixa.Create(aConexao: TFDConnection);
begin
  ConexaoDB   := aConexao;
end;

function TCaixa.FaturarVenda(aPreVendaId: Integer): Boolean;
var
  Qry, QryItens: TFDQuery;
  oEstoque: TControleEstoque;
  vNovaVendaId: Integer;
begin
  Result := True;
  Qry := TFDQuery.Create(nil);
  QryItens := TFDQuery.Create(nil);
  try
    Qry.Connection := ConexaoDB;
    QryItens.Connection := ConexaoDB;

    ConexaoDB.StartTransaction;
    try
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT status FROM preVenda WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.Open;

      if Qry.IsEmpty then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      if Qry.FieldByName('status').AsString = 'PAGO' then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      if Qry.FieldByName('status').AsString = 'CANCELADO' then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      Qry.Close;

      //Gerando a venda oficial
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO Vendas (clienteId, dataVenda, totalVenda) ');
      Qry.SQL.Add('OUTPUT INSERTED.vendaId AS vendaId '); // Pegamos o ID da venda gerada
      Qry.SQL.Add('SELECT clienteId, GETDATE(), totalVenda FROM preVenda WHERE preVendaId =:id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.Open;
      vNovaVendaId := Qry.FieldByName('vendaId').AsInteger;
      Self.F_vendaId := vNovaVendaId;
      Qry.Close;

      //Transfere os itens do rascunho para Vendas Itens
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO vendasItens (vendaId, produtoId, valorUnitario, quantidade, totalProduto) ');
      Qry.SQL.Add('SELECT :novaVendaId, produtoId, valorUnitario, quantidade, totalProduto ');
      Qry.SQL.Add('FROM preVendaItens WHERE preVendaId =:id');
      Qry.ParamByName('novaVendaId').AsInteger := vNovaVendaId;
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.ExecSQL;

      //Atualiza a Pré-Venda e Busca os itens para baixar o estoque
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE preVenda SET status = ''PAGO'' WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.ExecSQL;

      QryItens.SQL.Clear;
      QryItens.SQL.Add('SELECT produtoId, quantidade FROM preVendaItens WHERE preVendaId = :id');
      QryItens.ParamByName('id').AsInteger := aPreVendaId;
      QryItens.Open;

      // Chama o estoque e faz a baixa física
      oEstoque := TControleEstoque.Create(ConexaoDB);
      try
        QryItens.First;
        while not QryItens.Eof do
        begin
          oEstoque.ProdutoId  := QryItens.FieldByName('produtoId').AsInteger;
          oEstoque.Quantidade := QryItens.FieldByName('quantidade').AsFloat;
          oEstoque.BaixarEstoque;
          QryItens.Next;
        end;
      finally
        FreeAndNil(oEstoque);
      end;

      ConexaoDB.Commit; // Deu tudo certo? Salva no banco!
    except
    on E:Exception do begin
      ConexaoDB.Rollback; // Deu BO? Desfaz tudo pra não cobrar sem dar o produto!
      Result := False;
    end;

    end;
  finally
    FreeAndNil(Qry);
    FreeAndNil(QryItens);
  end;
end;

function TCaixa.CancelarPreVenda(aPreVendaId: Integer): Boolean;
var Qry:TFDQuery;
begin
  Result := True;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := ConexaoDB;

    ConexaoDB.StartTransaction;
    try
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT status FROM preVenda WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.Open;

      if Qry.IsEmpty then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      if Qry.FieldByName('status').AsString = 'PAGO' then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      if Qry.FieldByName('status').AsString = 'CANCELADO' then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      if Qry.FieldByName('status').AsString = 'RETORNADO' then
      begin
        ConexaoDB.Rollback;
        Result := False;
        Exit;
      end;

      Qry.Close;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE preVenda SET status = ''CANCELADO'' WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.ExecSQL;

      ConexaoDB.Commit;
    except
      on E: Exception do
      begin
        ConexaoDB.Rollback;
        ShowMessage('Ocorreu um erro '+ E.Message);
        Result := False
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TCaixa.ExtornarVenda(aPreVendaId: Integer): Boolean;
var Qry: TFDQuery;
    oEstoque: TControleEstoque;
begin
  Result := True;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := ConexaoDB;
    ConexaoDB.StartTransaction;

    try
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT status FROM preVenda WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.Open;

      if Qry.FieldByName('status').AsString <> 'PAGO' then
      begin
        ConexaoDB.Rollback;
        MessageDlg('Só é possível extornar uma venda PAGA.', mtWarning, [mbOK],0);
        Result := False;
        Exit;
      end;

      Qry.Close;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE preVenda SET status = ''RETORNADO'' WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.ExecSQL;

      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT produtoId, quantidade FROM preVendaItens WHERE preVendaId = :id');
      Qry.ParamByName('id').AsInteger := aPreVendaId;
      Qry.Open;

      oEstoque := TControleEstoque.Create(ConexaoDB);
      try
        Qry.First;
        while not Qry.Eof do
        begin
          oEstoque.ProdutoId  := Qry.FieldByName('produtoId').AsInteger;
          oEstoque.Quantidade := Qry.FieldByName('quantidade').AsFloat;
          oEstoque.RetornarEstoque;
          Qry.Next;
        end;
      finally
        FreeAndNil(oEstoque);
      end;

      ConexaoDB.Commit;
    except
      on E: Exception do
      begin
        ConexaoDB.Rollback;
        ShowMessage('Ocorreu um erro '+ E.Message);
        Result := False
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
