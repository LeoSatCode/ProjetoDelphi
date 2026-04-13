unit uRelCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCategoria = class(TForm)
    QryCategorias: TFDQuery;
    fdtncfldQryCategoriascategoriaId: TFDAutoIncField;
    strngfldQryCategoriasdescricao: TStringField;
    dtsCategorias: TDataSource;
    Relatorio: TRLReport;
    cabecalho: TRLBand;
    rlbl1: TRLLabel;
    rldrw1: TRLDraw;
    rlpdfltr1: TRLPDFFilter;
    Rodape: TRLBand;
    rldrw2: TRLDraw;
    rlsystmnf1: TRLSystemInfo;
    rlsystmnf2: TRLSystemInfo;
    rlsystmnf3: TRLSystemInfo;
    rlbl2: TRLLabel;
    rlbl3: TRLLabel;
    Detail: TRLBand;
    rldbtxtcategoriaId: TRLDBText;
    rldbtxtcategoriaId1: TRLDBText;
    rlbnd1: TRLBand;
    rlpnl1: TRLPanel;
    rlbl4: TRLLabel;
    rlbl5: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCategoria: TfrmRelCategoria;

implementation

{$R *.dfm}

procedure TfrmRelCategoria.FormCreate(Sender: TObject);
begin
  QryCategorias.Open;
end;

procedure TfrmRelCategoria.FormDestroy(Sender: TObject);
begin
  QryCategorias.Close;
end;

end.
