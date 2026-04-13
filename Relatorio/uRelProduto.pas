unit uRelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelProduto = class(TForm)
    QryProdutos: TFDQuery;
    dtsProdutos: TDataSource;
    Relatorio: TRLReport;
    cabecalho: TRLBand;
    rlbl1: TRLLabel;
    rldrw1: TRLDraw;
    rlpdfltr1: TRLPDFFilter;
    rlbnds: TRLBand;
    rldrw2: TRLDraw;
    rlsystmnf1: TRLSystemInfo;
    rlsystmnf2: TRLSystemInfo;
    rlsystmnf3: TRLSystemInfo;
    rlbl2: TRLLabel;
    rlbl3: TRLLabel;
    Detail: TRLBand;
    rldbtxtcategoriaId: TRLDBText;
    rlbnd1: TRLBand;
    rlpnl1: TRLPanel;
    rlbl4: TRLLabel;
    rlbl5: TRLLabel;
    fdtncfldQryProdutosprodutoId: TFDAutoIncField;
    strngfldQryProdutosnome: TStringField;
    fmtbcdfldQryProdutosvalor: TFMTBCDField;
    fmtbcdfldQryProdutosquantidade: TFMTBCDField;
    rlbl6: TRLLabel;
    rlbl7: TRLLabel;
    rldbtxtcategoriaId1: TRLDBText;
    rldbtxtvalor: TRLDBText;
    rldbtxtnome: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProduto: TfrmRelProduto;

implementation

{$R *.dfm}

procedure TfrmRelProduto.FormCreate(Sender: TObject);
begin
  QryProdutos.Open;
end;

procedure TfrmRelProduto.FormDestroy(Sender: TObject);
begin
  QryProdutos.Close;
end;

end.
