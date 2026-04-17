unit uRelPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter, Vcl.DBCGrids;

type
  TfrmRelProVenda = class(TForm)
    QryVendas: TFDQuery;
    dtsVendas: TDataSource;
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
    BandaDoGrupo: TRLGroup;
    rlbnd2: TRLBand;
    rlbnd3: TRLBand;
    rldbtxtprodutoId: TRLDBText;
    rldbtxtnome: TRLDBText;
    rldbtxtvalor: TRLDBText;
    rlbl9: TRLLabel;
    rldbtxtprodutoId1: TRLDBText;
    rlbnd5: TRLBand;
    rldbrsltTotalVenda: TRLDBResult;
    rldrw4: TRLDraw;
    rlbl7: TRLLabel;
    dtsVendasItens: TDataSource;
    QryVendaItens: TFDQuery;
    rlbl5: TRLLabel;
    rlbl6: TRLLabel;
    rlsbdtl1: TRLSubDetail;
    rlbnd1: TRLBand;
    rlbnd4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    rlbl10: TRLLabel;
    rldbtxtNome1: TRLDBText;
    rlbl4: TRLLabel;
    rldbtxtvalorUnitario: TRLDBText;
    rlbl8: TRLLabel;
    rlbl11: TRLLabel;
    rldbtxtvendaId: TRLDBText;
    QryVendaspreVendaId: TFDAutoIncField;
    QryVendasclienteId: TIntegerField;
    QryVendasnome: TStringField;
    QryVendasdataEmissao: TSQLTimeStampField;
    QryVendastotalVenda: TBCDField;
    QryVendaItenspreVendaItemId: TFDAutoIncField;
    QryVendaItensprodutoId: TIntegerField;
    QryVendaItensNome: TStringField;
    QryVendaItensquantidade: TFMTBCDField;
    QryVendaItensvalorUnitario: TFMTBCDField;
    QryVendaItenstotalProduto: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProVenda: TfrmRelProVenda;

implementation

{$R *.dfm}

procedure TfrmRelProVenda.FormCreate(Sender: TObject);
begin
  QryVendas.Open;
  QryVendaItens.Open;
end;

procedure TfrmRelProVenda.FormDestroy(Sender: TObject);
begin
  QryVendas.Close;
  QryVendaItens.Close;
end;

end.
