unit uDTMGrafico;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdtmGrafico = class(TDataModule)
    QryProdutoEstoque: TFDQuery;
    strngfldQryProdutoEstoqueLabel: TStringField;
    fmtbcdfldQryProdutoEstoqueValue: TFMTBCDField;
    dsProdutoEstoque: TDataSource;
    QryVendaValorPorCliente: TFDQuery;
    strngfldQryVendaValorPorClienteLabel: TStringField;
    fmtbcdfldQryVendaValorPorClienteValue: TFMTBCDField;
    QryProdutosMaisVendidos: TFDQuery;
    strngfldQryProdutosMaisVendidoslabel: TStringField;
    fmtbcdfldQryProdutosMaisVendidosValue: TFMTBCDField;
    QryVendasDaUltimaSemana: TFDQuery;
    sqltmstmpfldQryVendasDaUltimaSemanaLabel: TSQLTimeStampField;
    fmtbcdfldQryVendasDaUltimaSemanavalue: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmGrafico: TdtmGrafico;

implementation

uses
  uDTMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
