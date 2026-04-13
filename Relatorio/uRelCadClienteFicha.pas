unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelClienteFicha = class(TForm)
    QryFichaCliente: TFDQuery;
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
    fdtncfldQryClienteclienteId: TFDAutoIncField;
    strngfldQryClientenome: TStringField;
    strngfldQryClientetelefone: TStringField;
    strngfldQryClienteemail: TStringField;
    rldbtxtnome1: TRLDBText;
    strngfldQryClienteendereco: TStringField;
    strngfldQryClientebairro: TStringField;
    strngfldQryClientecidade: TStringField;
    strngfldQryClienteestado: TStringField;
    strngfldQryClientecep: TStringField;
    sqltmstmpfldQryClientedatanascimento: TSQLTimeStampField;
    rlbl6: TRLLabel;
    rlbl7: TRLLabel;
    rlbl5: TRLLabel;
    rlbl4: TRLLabel;
    rlbl8: TRLLabel;
    rldbtxtendereco: TRLDBText;
    rlbl9: TRLLabel;
    rldbtxtbairro: TRLDBText;
    rlbl10: TRLLabel;
    rldbtxtcidade: TRLDBText;
    rlbl11: TRLLabel;
    rldbtxtestado: TRLDBText;
    rlbl12: TRLLabel;
    rldbtxttelefone: TRLDBText;
    rlbl13: TRLLabel;
    rldbtxttelefone1: TRLDBText;
    rldbtxtnome: TRLDBText;
    rldrw3: TRLDraw;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClienteFicha: TfrmRelClienteFicha;

implementation

{$R *.dfm}


procedure TfrmRelClienteFicha.FormCreate(Sender: TObject);
begin
  QryFichaCliente.Open;
end;

procedure TfrmRelClienteFicha.FormDestroy(Sender: TObject);
begin
  QryFichaCliente.Close;
end;

end.
