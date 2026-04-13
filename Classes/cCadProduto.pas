unit cCadProduto;

interface

uses System.Classes,
     Vcl.Controls, System.StrUtils, Vcl.Imaging.jpeg, Vcl.Graphics,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TProduto = class
  private
    ConexaoDB:TFDConnection;
    F_produtoId:Integer;
    F_nome:string;
    F_descricao:string;
    F_valor:Double;
    F_quantidade:Double;
    F_categoriaId:Integer;
    F_Foto:TBitmap;

  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;

  published
    property codigo             :Integer      read F_produtoId      write F_produtoId;
    property nome               :string       read F_nome           write F_nome;
    property descricao          :string       read F_descricao      write F_descricao;
    property valor              :Double       read F_valor          write F_valor;
    property quantidade         :Double       read F_quantidade     write F_quantidade;
    property categoriaId        :Integer      read F_categoriaId    write F_categoriaId;
    property foto               :TBitmap      read F_Foto           write F_Foto;
end;

implementation

{$REGION 'Constructor and Destructor'}
constructor TProduto.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
  F_Foto   :=TBitmap.Create;
  F_Foto.Assign(nil);
end;

destructor TProduto.Destroy;
begin
  if Assigned(F_Foto) then begin
     F_Foto.Assign(nil);
     F_Foto.Free;
  end;
  inherited;
end;
{$ENDREGION}

{$REGION 'Métodos CRUD'}
function TProduto.Apagar:Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código:  '+IntToStr(F_produtoId)+#13+
                'Descrição: '+F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
      Result:=False;
      Abort;
  end;

  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('DELETE FROM produtos '+
            '  WHERE produtoId = :produtoId');
      ParamByName('produtoId').AsInteger := F_produtoId;
    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TProduto.Atualizar: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('UPDATE produtos ' +
              '   SET nome        =:nome '+
              '       ,descricao  =:descricao '+
              '       ,valor      =:valor '+
              '       ,quantidade =:quantidade '+
              '       ,categoriaId=:categoriaId '+
              '       ,foto       =:foto '+
              ' WHERE produtoId   =:produtoId ');

      ParamByName('produtoId').AsInteger     :=Self.F_produtoId;
      ParamByName('nome').AsString           :=Self.F_nome;
      ParamByName('descricao').AsString      :=Self.F_descricao;
      ParamByName('valor').AsFloat           :=Self.F_valor;
      ParamByName('quantidade').AsFloat      :=Self.F_quantidade;
      ParamByName('categoriaId').AsInteger   :=Self.F_categoriaId;

      with Qry.ParamByName('foto') do
      begin
        DataType := ftBlob;

          if Self.F_Foto.Empty then Clear
          else
            Assign(Self.F_Foto);
      end;

      try
        ConexaoDB.StartTransaction;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      except
        ConexaoDB.Rollback;
        Result:=False;
      end;
      end;
    finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TProduto.Inserir:Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('INSERT INTO produtos (nome, '+
              '                      descricao, '+
              '                      valor, '+
              '                      quantidade, '+
              '                      categoriaId, '+
              '                      foto ) '+
              'VALUES               (:nome, '+
              '                      :descricao, '+
              '                      :valor, '+
              '                      :quantidade, '+
              '                      :categoriaId, ' +
              '                      :foto) ' );

      ParamByName('nome').AsString                :=Self.F_nome;
      ParamByName('descricao').AsString           :=Self.F_descricao;
      ParamByName('valor').AsFloat                :=Self.F_valor;
      ParamByName('quantidade').AsFloat           :=Self.F_quantidade;
      ParamByName('categoriaId').AsInteger        :=Self.F_categoriaId;

      if Self.F_Foto.Empty then
         Qry.ParamByName('foto').Clear
      else
         Qry.ParamByName('foto').Assign(Self.F_Foto);

      try
        ConexaoDB.StartTransaction;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      except
        ConexaoDB.Rollback;
        Result:=False;
      end;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TProduto.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear;
      SQL.Add('SELECT produtoId, '+
              '       nome, '+
              '       descricao, '+
              '       valor, ' +
              '       quantidade, '+
              '       categoriaId, '+
              '       foto '+
              '  FROM produtos '+
              ' WHERE produtoId = :produtoId');
      ParamByName('produtoId').AsInteger:=id;
      try
        Open;

        Self.F_produtoId      := FieldByName('produtoId').AsInteger;
        Self.F_nome           := FieldByName('nome').AsString;
        Self.F_descricao      := FieldByName('descricao').AsString;
        Self.valor            := FieldByName('valor').AsFloat;
        Self.F_quantidade     := FieldByName('quantidade').AsFloat;
        Self.F_categoriaId    := FieldByName('categoriaId').AsInteger;
        Self.F_Foto.Assign(Qry.FieldByName('foto'));
      except
      Result:=False;
      end;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}
end.
