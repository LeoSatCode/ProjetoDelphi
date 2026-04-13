unit cControleEstoque;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
     Datasnap.DBClient;

type
  TControleEstoque = class
  private
    ConexaoDB:TFDConnection;
    F_ProdutoId:Integer;
    F_Quantidade:Double;
  public
    constructor Create(aConexao: TFDConnection);
    destructor Destroy; override;
    function BaixarEstoque: Boolean;
    function RetornarEstoque: Boolean;
  published
    property ProdutoId:Integer    read F_ProdutoId    write F_ProdutoId;
    property Quantidade:Double    read F_Quantidade   write F_Quantidade;
  end;

implementation

{ TControleEstoque }

{$REGION 'Overrides'}
constructor TControleEstoque.Create(aConexao: TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

destructor TControleEstoque.Destroy;
begin

  inherited;
end;
{$ENDREGION}

function TControleEstoque.BaixarEstoque: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE produtos '+
                '   SET quantidade = quantidade - :qtdeBaixa '+
                ' WHERE produtoId=:produtoId ');
    Qry.ParamByName('produtoId').AsInteger  :=ProdutoId;
    Qry.ParamByName('qtdeBaixa').AsFloat    :=Quantidade;
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

function TControleEstoque.RetornarEstoque: Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=True;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE produtos '+
                '   SET quantidade = quantidade + :qtdeRetorno '+
                ' WHERE produtoId=:produtoId ');
    Qry.ParamByName('produtoId').AsInteger  :=ProdutoId;
    Qry.ParamByName('qtdeRetorno').AsFloat  :=Quantidade;
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
end.
