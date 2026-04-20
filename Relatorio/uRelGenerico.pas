unit uRelGenerico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter, Vcl.DBCGrids;

type
  TfrmGenerico = class(TForm)
    Relatorio: TRLReport;
    cabecalho: TRLBand;
    rlbl1: TRLLabel;
    rldrw1: TRLDraw;
    rlbnds: TRLBand;
    rldrw2: TRLDraw;
    rlsystmnf1: TRLSystemInfo;
    rlsystmnf2: TRLSystemInfo;
    rlsystmnf3: TRLSystemInfo;
    rlbl2: TRLLabel;
    rlbl3: TRLLabel;
    BandaDoGrupo: TRLGroup;
    rlbnd2: TRLBand;
    rlbl9: TRLLabel;
    rldbtxtprodutoId1: TRLDBText;
    rlbnd3: TRLBand;
    rldbtxtprodutoId: TRLDBText;
    rldbtxtnome: TRLDBText;
    rldbtxtvalor: TRLDBText;
    rlbl5: TRLLabel;
    rlbl6: TRLLabel;
    rlsbdtl1: TRLSubDetail;
    rlbnd1: TRLBand;
    rlbl10: TRLLabel;
    rlbl4: TRLLabel;
    rlbl8: TRLLabel;
    rlbl11: TRLLabel;
    rldbtxtvendaId: TRLDBText;
    rlbnd4: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    rldbtxtNome1: TRLDBText;
    rldbtxtvalorUnitario: TRLDBText;
    rlbnd5: TRLBand;
    rldbrsltTotalVenda: TRLDBResult;
    rldrw4: TRLDraw;
    rlbl7: TRLLabel;
    QryMaster: TFDQuery;
    dsMaster: TDataSource;
    rlpdfltr1: TRLPDFFilter;
    dsDetalhes: TDataSource;
    QryDetalhes: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenerico: TfrmGenerico;

implementation

{$R *.dfm}

procedure TfrmGenerico.FormCreate(Sender: TObject);
begin
  QryMaster.Open;
  QryDetalhes.Open;
end;

procedure TfrmGenerico.FormDestroy(Sender: TObject);
begin
  QryMaster.Close;
  QryDetalhes.Close;
end;

end.
