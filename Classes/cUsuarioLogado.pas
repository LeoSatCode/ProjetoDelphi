unit cUsuarioLogado;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TUsuarioLogado = class
  private
    F_usuarioId:Integer;
    F_nome:string;
    F_senha:string;

  public
    class function TenhoAcesso(aUsuarioId: Integer; aChave: string; aConexao: TFDConnection): Boolean; static;

  published
    property codigo   :Integer    read F_usuarioId    write F_usuarioId;
    property nome     :string     read F_nome         write F_nome;
    property senha    :string     read F_senha        write F_senha;
  end;

implementation

  class function TUsuarioLogado.TenhoAcesso(aUsuarioId: Integer; aChave: string; aConexao: TFDConnection): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=aConexao;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT usuarioId '+
                '  FROM usuariosAcaoAcesso '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=(SELECT TOP 1 acaoAcessoId FROM acaoAcesso WHERE chave=:chave) '+
                '   AND ativo=1');
    Qry.ParamByName('usuarioId').AsInteger    :=aUsuarioId;
    Qry.ParamByName('chave').AsString         :=aChave;

    Qry.Open;

    if Qry.IsEmpty then Result:=False;
  finally
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

end.
