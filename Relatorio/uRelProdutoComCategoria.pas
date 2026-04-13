unit uRelProdutoComCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter, Vcl.DBCGrids;

type
  TfrmRelProdutoComCategoria = class(TForm)
    QryProdutosComCategoria: TFDQuery;
    dtsProdutosComCategoria: TDataSource;
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
    fdtncfldQryProdutosComCategoriaprodutoId: TFDAutoIncField;
    strngfldQryProdutosComCategorianome: TStringField;
    strngfldQryProdutosComCategoriadescricao: TStringField;
    BandaDoGrupo: TRLGroup;
    rlbnd2: TRLBand;
    intgrfldQryProdutosComCategoriacategoriaId: TIntegerField;
    rlbnd1: TRLBand;
    rlpnl1: TRLPanel;
    rlbl4: TRLLabel;
    rlbl5: TRLLabel;
    rlbl6: TRLLabel;
    rlbl7: TRLLabel;
    rlbnd3: TRLBand;
    rldbtxtprodutoId: TRLDBText;
    rldbtxtnome: TRLDBText;
    rldbtxtquantidade: TRLDBText;
    rldbtxtvalor: TRLDBText;
    rlbl9: TRLLabel;
    rlbl10: TRLLabel;
    rldbtxtprodutoId1: TRLDBText;
    rldbtxtdescricao1: TRLDBText;
    rlbnd4: TRLBand;
    rldbrsltvalor: TRLDBResult;
    QryProdutosComCategoriaValor: TBCDField;
    QryProdutosComCategoriaQuantidade: TBCDField;
    rldrw3: TRLDraw;
    rlbl8: TRLLabel;
    rlbl11: TRLLabel;
    rldbrsltquantidade: TRLDBResult;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutoComCategoria: TfrmRelProdutoComCategoria;

implementation

{$R *.dfm}

procedure TfrmRelProdutoComCategoria.FormCreate(Sender: TObject);
begin
  QryProdutosComCategoria.Open;
end;

procedure TfrmRelProdutoComCategoria.FormDestroy(Sender: TObject);
begin
  QryProdutosComCategoria.Close;
end;

end.
