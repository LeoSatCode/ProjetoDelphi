unit uRelVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter, Vcl.DBCGrids;

type
  TfrmRelVendaPorData = class(TForm)
    QryVendaPorData: TFDQuery;
    dtsVendaPorData: TDataSource;
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
    rlbnd1: TRLBand;
    rlpnl1: TRLPanel;
    rlbl4: TRLLabel;
    rlbl5: TRLLabel;
    rlbl6: TRLLabel;
    rlbnd3: TRLBand;
    rldbtxtprodutoId: TRLDBText;
    rldbtxtnome: TRLDBText;
    rldbtxtvalor: TRLDBText;
    rlbl9: TRLLabel;
    rldbtxtprodutoId1: TRLDBText;
    rlbnd4: TRLBand;
    rldbrsltvalor: TRLDBResult;
    rldrw3: TRLDraw;
    rlbl8: TRLLabel;
    QryVendaPorDatavendaId: TFDAutoIncField;
    QryVendaPorDataclienteId: TIntegerField;
    QryVendaPorDatanome: TStringField;
    QryVendaPorDatadataVenda: TSQLTimeStampField;
    QryVendaPorDataTotalVenda: TBCDField;
    rlbnd5: TRLBand;
    rldbrsltTotalVenda: TRLDBResult;
    rldrw4: TRLDraw;
    rlbl7: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendaPorData: TfrmRelVendaPorData;

implementation

{$R *.dfm}

procedure TfrmRelVendaPorData.FormCreate(Sender: TObject);
begin
  QryVendaPorData.Open;
end;

procedure TfrmRelVendaPorData.FormDestroy(Sender: TObject);
begin
  QryVendaPorData.Close;
end;

end.
