unit cAtualizacaoBandoDeDados;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
     FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,uDTMConexao;

type
  TAtualizaBancoDados = class

  private

  public
    ConexaoDB:TFDConnection;
    constructor Create(aConexao: TFDConnection);
    procedure ExecutaDiretoBancoDeDados(aScript: string);
  end;

Type
  TAtualizaBancoDadosMSSQL = class
    private
    public
      ConexaoDB:TFDConnection;
      function  AtualizarBancoDeDadoMSSQL: Boolean;
      constructor Create(aConexao: TFDConnection);
  end;

implementation

uses cAtualizacaoTabelaMSSQL, cAtualizacaoCampoMSSQL;

{ TAtualizaBancoDados }

constructor TAtualizaBancoDados.Create(aConexao: TFDConnection);
begin
  ConexaoDB:=aConexao; //Recebe a conexão e passa para o construtor
end;

procedure TAtualizaBancoDados.ExecutaDiretoBancoDeDados(aScript: string);
var Qry:TFDQuery;
begin
  try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(aScript);
    try
      ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      ConexaoDB.Commit;
    except
      ConexaoDB.Rollback
    end;
  finally
    Qry.Close;
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

{ TAtualizaBancoDadosMSSQL }

function TAtualizaBancoDadosMSSQL.AtualizarBancoDeDadoMSSQL: Boolean;
var oAtualizarDB:TAtualizaBancoDados;
    oTabela: TAtualizacaoTableMSSQL;
    oCampo:  TAtualizacaoCampoMSSQL;
begin
  try
    //Classe Princioal de Atualização
    oAtualizarDB := TAtualizaBancoDados.Create(ConexaoDB);

    //Classe Filha(Herança) de Atualização
    oTabela := TAtualizacaoTableMSSQL.Create(ConexaoDB);
    oCampo  := TAtualizacaoCampoMSSQL.Create(ConexaoDB);
  finally
    if Assigned(oAtualizarDB) then FreeAndNil(oAtualizarDB);

    if Assigned(oTabela) then FreeAndNil(oTabela);
  end;

end;

constructor TAtualizaBancoDadosMSSQL.Create(aConexao: TFDConnection);
begin
  ConexaoDB:=aConexao;
end;

end.
