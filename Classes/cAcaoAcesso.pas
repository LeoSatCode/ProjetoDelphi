unit cAcaoAcesso;

interface

uses System.Classes,Vcl.Controls,Vcl.ExtCtrls,
     Vcl.Dialogs,Vcl.Forms,Vcl.Buttons,
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf,PngBitBtn,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client,uDTMConexao, System.SysUtils;

type
  TAcaoAcesso = class
  private
    ConexaoDB:TFDConnection;
    F_acaoAcessoId:Integer;
    F_descricao:string;
    F_chave:String;
    class procedure PreencherAcoes(aForm: TForm; aConexao:TFDConnection); static;
    class procedure VerificarUsuarioAcao(aUsuarioId, aAcaoAcessoId:Integer; aConexao:TFDConnection); static;

  public
    constructor Create(aConexao:TFDConnection);
    destructor  Destroy; override;

    function    Inserir:Boolean;                  //C
    function    Selecionar(id:Integer):Boolean;   //R
    function    Atualizar:Boolean;                //U
    function    Apagar:Boolean;                   //D

    function        ChaveExiste(aChave:string; aId:Integer=0):Boolean;
    class procedure CriarAcoes(aNomeForm: TFormClass; aConexao: TFDConnection); static;
    class procedure PreencherUsuariosVsAcoes(aConexao:TFDConnection); static;

  published
    property codigo     :Integer    read F_acaoAcessoId   write F_acaoAcessoId;
    property descricao  :string     read F_descricao      write F_descricao;
    property chave      :string     read F_chave          write F_chave;
  end;

implementation

{ TAcaoAcesso }

{$REGION 'Destructor and Destructor'}

constructor TAcaoAcesso.Create(aConexao: TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TAcaoAcesso.Destroy;
begin

  inherited;
end;
{$ENDREGION}

{$REGION 'Métodos CRUD'}
function TAcaoAcesso.Inserir: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO acaoAcesso (descricao, '+
                '                        chave ) '+
                ' VALUES                (:descricao, '+
                '                        :chave )' );
    Qry.ParamByName('descricao').AsString   :=Self.F_descricao;
    Qry.ParamByName('chave').AsString       :=Self.F_chave;

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

function TAcaoAcesso.Selecionar(id: Integer): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT acaoAcessoId, '+
                '       descricao, '+
                '       chave ' +
                '  FROM acaoAcesso '+
                ' WHERE acaoAcessoId=:acaoAcessoId');
    Qry.ParamByName('acaoAcessoId').AsInteger:=id;
    try
      Qry.Open;

      Self.F_acaoAcessoId :=Qry.FieldByName('acaoAcessoId').AsInteger;
      Self.F_descricao    :=Qry.FieldByName('descricao').AsString;
      Self.F_chave        :=Qry.FieldByName('chave').AsString;
    except
      Result:=False;
    end;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

function TAcaoAcesso.Atualizar: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE acaoAcesso '+
                '   SET descricao   =:descricao '+
                '      ,chave       =:chave '+
                ' WHERE acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('acaoAcessoId').AsInteger  :=Self.F_acaoAcessoId;
    Qry.ParamByName('descricao').AsString      :=Self.F_descricao;
    Qry.ParamByName('chave').AsString          :=Self.F_chave;

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

function TAcaoAcesso.Apagar: Boolean;
var Qry:TFDQuery;
begin
  if MessageDlg('Apagar o Registro: '+#13+#13+
                'Código: '+IntToStr(F_acaoAcessoId)+#13+
                'Nome: '  +F_descricao, mtConfirmation, [mbYes, mbNo],0)=mrNo then
  Result:=False;
  Abort;  //Trocar por Exit (talvez)

  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM acaoAcesso '+
                ' WHERE acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('acaoAcessoId').AsInteger :=F_acaoAcessoId;
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
       FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

function TAcaoAcesso.ChaveExiste(aChave: string; aId:Integer): Boolean;
var Qry:TFDQuery;
begin
  Try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(acaoAcessoId) AS Qtde '+
                '   FROM acaoAcesso '+
                ' WHERE chave =:chave');
    if aId > 0 then
    begin
      Qry.SQL.Add(' AND acaoAcessoId<>:acaoAcessoId');
      Qry.ParamByName('acaoAcessoId').AsInteger :=aId;
    end;

    Qry.ParamByName('chave').AsString :=aChave;
    try
      Qry.Open;

      if Qry.FieldByName('Qtde').AsInteger>0 then
         Result:=True
      else
         Result:=False;
    except
      Result:=False;
    end;
  Finally
    if Assigned(Qry) then FreeAndNil(Qry);
  End;
end;


class procedure TAcaoAcesso.PreencherAcoes(aForm: TForm; aConexao: TFDConnection);
var i:Integer;
    oAcaoAcesso:TAcaoAcesso;
begin
  try
    oAcaoAcesso:=TAcaoAcesso.Create(aConexao);
    oAcaoAcesso.descricao :=aForm.Caption;
    oAcaoAcesso.chave     :=aForm.Name;
    if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.Chave) then
      oAcaoAcesso.Inserir;

    for I := 0 to aForm.ComponentCount - 1 do
    begin
      if (aForm.Components[i] is TPngBitBtn) then
      begin
        if TPngBitBtn(aForm.Components[i]).Tag=99 then
        begin
          oAcaoAcesso.descricao :='   - BOTÃO '+StringReplace(TPngBitBtn(aForm.Components[i]).Caption,'&','',[rfReplaceAll]);
          oAcaoAcesso.chave     :=aForm.Name+'_'+TPngBitBtn(aForm.Components[i]).Name;
          if not oAcaoAcesso.ChaveExiste(oAcaoAcesso.Chave) then
             oAcaoAcesso.Inserir;
        end;
      end;
    end;

  finally
    if Assigned(oAcaoAcesso) then
       FreeAndNil(oAcaoAcesso);
  end;
end;

class procedure TAcaoAcesso.CriarAcoes(aNomeForm: TFormClass; aConexao: TFDConnection);
var form: TForm; //Var do tipo formulário
begin
  try
    form  := aNomeForm.Create(Application);
    PreencherAcoes(form, aConexao);
  finally
    if Assigned(form) then form.Release;
  end;
end;

class procedure TAcaoAcesso.VerificarUsuarioAcao(aUsuarioId, aAcaoAcessoId: Integer; aConexao: TFDConnection);
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId '+
                '  FROM usuariosAcaoAcesso '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('usuarioId').AsInteger:=aUsuarioId;
    Qry.ParamByName('acaoAcessoId').AsInteger:=aAcaoAcessoId;
    Qry.Open;

    if Qry.IsEmpty then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO usuariosAcaoAcesso (usuarioId, acaoAcessoId, ativo) '+
                  '     VALUES (:usuarioId, :acaoAcessoId, :ativo) ' );
      Qry.ParamByName('usuarioId').AsInteger:=aUsuarioId;
      Qry.ParamByName('acaoAcessoId').AsInteger:=aAcaoAcessoId;
      Qry.ParamByName('ativo').AsBoolean:=true;
      try
        aConexao.StartTransaction;
        Qry.ExecSQL;
        aConexao.Commit;
      except
        aConexao.Rollback;
      end;
    end;

  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

class procedure TAcaoAcesso.PreencherUsuariosVsAcoes(aConexao: TFDConnection);
var Qry:TFDQuery;
    QryAcaoAcesso:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;

    QryAcaoAcesso:=TFDQuery.Create(nil);
    QryAcaoAcesso.Connection:=aConexao;
    QryAcaoAcesso.SQL.Clear;

    Qry.SQL.Add('SELECT usuarioId FROM usuarios ');
    Qry.Open;

    QryAcaoAcesso.SQL.Add('SELECT acaoAcessoId FROM acaoAcesso ');
    QryAcaoAcesso.Open;

    Qry.First;
    while not Qry.Eof do  //usuarios
    begin

      QryAcaoAcesso.First;
      while not QryAcaoAcesso.Eof do //AcaoAcesso
      begin
        VerificarUsuarioAcao(Qry.FieldByName('usuarioId').AsInteger,
                             QryAcaoAcesso.FieldByName('acaoAcessoId').AsInteger,
                             aConexao);
        QryAcaoAcesso.Next;
      end;

      Qry.Next;
    end;

  finally
    if Assigned(Qry) then
       FreeAndNil(Qry);
    if Assigned(QryAcaoAcesso) then
       FreeAndNil(QryAcaoAcesso);
  end;

end;

end.
