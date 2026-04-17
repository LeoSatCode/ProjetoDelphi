unit cCadUsuario;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
     FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
     Data.DB, FireDAC.Comp.Client, uFuncaoCriptografia, uLogin, uDTMConexao;

type
TUsuario = class
  private
    ConexaoDB:TFDConnection;
    F_usuarioId:Integer;
    F_nome:string;
    F_senha:string;
    function getSenha: string;
    procedure setSenha(const Value:string);

  public
    constructor Create(aConexao: TFDConnection);
    destructor Destroy; override;
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Apagar:Boolean;
    function Selecionar(id:Integer):Boolean;
    function Login(aUsuario, aSenha: string): Boolean;
    function UsuarioExiste(aUsuario: string): Boolean;
    function AlterarSenha: Boolean;

  published
    property codigo   :Integer    read F_usuarioId   write F_usuarioId;
    property nome     :string     read F_nome        write F_nome;
    property senha    :string     read getSenha      write setSenha;
end;

implementation

{$REGION 'Constructor and Destructor'}
constructor TUsuario.Create(aConexao: TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;
{$ENDREGION}

{ TUsuario }

{$REGION 'Métodos CRUD'}
function TUsuario.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_usuarioId)+#13+
                'Nome: '  +F_nome,mtConfirmation,[mbYes, mbNo],0)=mrNo then begin
     Result:=False;
     Abort;
  end;

  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('delete from usuariosAcaoAcesso where usuarioId = :usuarioId '+
                'delete from usuarios where usuarioId = :usuarioId ');
                Qry.ParamByName('usuarioId').AsInteger :=F_usuarioId;
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

function TUsuario.Atualizar: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuarios '+
                '   SET nome      =:nome '+
                '      ,senha     =:senha '+
                ' WHERE usuarioId =:usuarioId ');
    Qry.ParamByName('usuarioId').AsInteger   :=Self.F_usuarioId;
    Qry.ParamByName('nome').     AsString    :=Self.F_nome;
    Qry.ParamByName('senha').    AsString    :=Self.F_senha;

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

function TUsuario.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO usuarios (nome, '+
                '                      senha )'+
                ' VALUES              (:nome, '+
                '                      :senha )' );
    Qry.ParamByName('nome').     AsString    :=Self.F_nome;
    Qry.ParamByName('senha').    AsString    :=Self.F_senha;
    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    If Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TUsuario.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId, '+
                '       nome, '+
                '       senha '+
                '  FROM usuarios '+
                ' WHERE usuarioId=:usuarioId ');
    Qry.ParamByName('usuarioId').AsInteger:=id;
    try
      Qry.Open;

      Self.F_usuarioId    := Qry.FieldByName('usuarioId').AsInteger;
      Self.F_nome         := Qry.FieldByName('nome').AsString;
      Self.F_senha        := Qry.FieldByName('senha').AsString;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;;
end;

function TUsuario.UsuarioExiste(aUsuario:string):Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(usuarioId) AS Qtde '+
                '  FROM usuarios '+
                ' WHERE nome =:nome ');
    Qry.ParamByName('nome').AsString :=aUsuario;
    try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         result:= True
      else
         result:=false;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

{$REGION 'Getter and Setters'}
function TUsuario.getSenha: string;
begin
  Result:= Descriptografar(Self.F_senha);
end;

procedure TUsuario.setSenha(const Value: string);
begin
  Self.F_senha := Criptografar(Value);
end;
{$ENDREGION}

{$REGION 'LOGIN'}
function TUsuario.Login(aUsuario:string; aSenha:string):Boolean;
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId, '+
                '       nome, ' +
                '       senha '+
                '  FROM usuarios '+
                ' WHERE nome=:nome AND senha=:senha ');
    Qry.ParamByName('nome').AsString:=aUsuario;
    Qry.ParamByName('senha').AsString:=Criptografar(aSenha);
    try
      Qry.Open;

      if Qry.FieldByName('usuarioId').AsInteger>0 then  begin
         F_usuarioId  :=Qry.FieldByName('usuarioId') .AsInteger;
         F_nome       :=Qry.FieldByName('nome').AsString;
         F_senha      :=Qry.FieldByName('senha').AsString;
         result:=True;
      end
      else
      Result:=False;

    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

{$REGION 'ALTERAÇÃO DE SENHA'}
function TUsuario.AlterarSenha: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=true;
    Qry:=TFDQuery.Create(nil); //Cria uma Qry em tempo de execução
    Qry.Connection:=ConexaoDB; //Coloca a conexão
    Qry.SQL.Clear;             //Limpa a conexão
    Qry.SQL.Add('UPDATE usuarios '+
                '   SET senha =:senha '+
                ' WHERE usuarioId=:usuarioId ');
    Qry.ParamByName('usuarioId').AsInteger    :=Self.F_usuarioId;
    Qry.ParamByName('senha').AsString         :=Self.F_senha;

    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
      Result:=True;
    except
      ConexaoDB.Rollback;
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

end.
