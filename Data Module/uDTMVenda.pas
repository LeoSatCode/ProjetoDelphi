unit uDTMVenda;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdtmVenda = class(TDataModule)
    QryCliente: TFDQuery;
    fdtncfldQryClienteclienteId: TFDAutoIncField;
    strngfldQryClientenome: TStringField;
    QryProdutos: TFDQuery;
    fdtncfldQryProdutosprodutoId: TFDAutoIncField;
    strngfldQryProdutosnome: TStringField;
    fmtbcdfldQryProdutosvalor: TFMTBCDField;
    fmtbcdfldQryProdutosquantidade: TFMTBCDField;
    cdsItensVenda: TClientDataSet;
    dtsItensVenda: TDataSource;
    dtsCliente: TDataSource;
    dtsProdutos: TDataSource;
    cdsItensVendaprodutoId: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaquantidade: TFloatField;
    cdsItensVendavalorUnitario: TFloatField;
    cdsItensVendavalorTotalProduto: TFloatField;
    QryClientesituacaoId: TIntegerField;
    QryClienteobservacao: TStringField;
    QryClienteUpdate: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVenda: TdtmVenda;

implementation

uses
  uDTMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVenda.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  QryCliente.Open;
  QryProdutos.Open;
end;

procedure TdtmVenda.DataModuleDestroy(Sender: TObject);
begin
 cdsItensVenda.Close;
 QryCliente.Close;
 QryProdutos.Close;
end;

end.
