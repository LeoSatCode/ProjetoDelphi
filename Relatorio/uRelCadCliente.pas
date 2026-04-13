unit uRelCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCliente = class(TForm)
    QryCliente: TFDQuery;
    dtsCliente: TDataSource;
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
    fdtncfldQryClienteclienteId: TFDAutoIncField;
    strngfldQryClientenome: TStringField;
    strngfldQryClientetelefone: TStringField;
    strngfldQryClienteemail: TStringField;
    rlbl6: TRLLabel;
    rlbl7: TRLLabel;
    rldbtxtnome: TRLDBText;
    rldbtxtnome1: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCliente: TfrmRelCliente;

implementation

{$R *.dfm}

procedure TfrmRelCliente.FormCreate(Sender: TObject);
begin
  QryCliente.Open;
end;

procedure TfrmRelCliente.FormDestroy(Sender: TObject);
begin
  QryCliente.Close;
end;

end.
