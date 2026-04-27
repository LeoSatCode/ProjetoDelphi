unit cCadCategoria;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TCategoria = class
  private
    ConexaoDB:TFDConnection;

    F_categoriaId:Integer;
    F_descricao:string;

    function getCodigo: Integer;
    function getDescricao: string;
    procedure setCodigo(const Value: Integer);
    procedure setDescricao(const Value: string);
  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer): Boolean;

  published
    property codigo:Integer   read getCodigo    write setCodigo;
    property descricao:string read getDescricao write setDescricao;
  end;

implementation

{ TCategoria }

{$REGION 'Constructor and Destructor'}
constructor TCategoria.Create(aConexao:TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TCategoria.Destroy;
begin

  inherited;
end;
{$ENDREGION}

{$REGION 'Métodos CRUD'}
function TCategoria.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+ //Espaço de duas linhas
                'Código: '+IntToStr(F_categoriaId)+#13+ //Espaço de uma linha
                'Descrição: '+F_descricao,mtConfirmation, [mbYes, mbNo], 0)=mrNo then begin
     Result:=False;
     Abort;
  end;
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
      Connection:=ConexaoDB;
      SQL.Clear ;
      SQL.Add('DELETE FROM categorias ' +
              ' WHERE categoriaId=:categoriaId ');
      ParamByName('categoriaId').AsInteger :=F_categoriaId;

      try
        ConexaoDB.StartTransaction;
        Qry.ExecSQL;
        ConexaoDB.Commit;
      except
        on E: EFDDBEngineException do
        begin
          if E.ErrorCode = 547 then
             MessageDlg('Não é possível excluir: Categoria possui produtos vinculados.', mtError, [mbOK], 0)
          else
             MessageDlg('Erro de BD: ' + E.Message, mtError, [mbOK], 0);
          Result := False;
        end;
      end;
    end;
  finally

  end;
end;

function TCategoria.Atualizar: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
    Connection:=ConexaoDB;
    SQL.Clear;
    SQL.Add('UPDATE categorias '+
            '   SET  descricao =:descricao '+
            ' WHERE categoriaId=:categoriaId ');
    ParamByName('categoriaId').AsInteger :=Self.F_categoriaId;
    ParamByName('descricao').AsString  :=Self.F_descricao;
    end;
    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then
       FreeAndNil (Qry);
  end;
end;

function TCategoria.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
    Connection:=ConexaoDB;
    SQL.Clear;
    SQL.Add('INSERT INTO categorias (descricao) values (:descricao)');
    ParamByName('descricao').AsString:=Self.F_descricao;

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
    if Assigned(Qry) then
       FreeAndNil (Qry);
  end;
end;

function TCategoria.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    with Qry do begin
    Connection:=ConexaoDB;
    SQL.Clear;
    SQL.Add('SELECT categoriaId,'+
            '       descricao '+
            ' FROM categorias '+
            ' WHERE categoriaId=:categoriaId');
    ParamByName('categoriaId').AsInteger:=id;
    end;
    try
      Qry.Open;
      Self.F_categoriaId := Qry.FieldByName('categoriaId').AsInteger;
      Self.F_descricao   := Qry.FieldByName('descricao').AsString;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then
       FreeAndNil (Qry);
  end;
end;
{$ENDREGION}

{$REGION 'Gets and Sets'}

//GETTERS
function TCategoria.getCodigo: Integer;
begin
  Result := Self.F_categoriaId
end;

function TCategoria.getDescricao: string;
begin
  Result := Self.F_descricao;
end;


//SETTERS
procedure TCategoria.setCodigo(const Value: Integer);
begin
  Self.F_categoriaId := Value;
end;

procedure TCategoria.setDescricao(const Value: string);
begin
  Self.F_descricao := Value;
end;
{$ENDREGION}
end.
