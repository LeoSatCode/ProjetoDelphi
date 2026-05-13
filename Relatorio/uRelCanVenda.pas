unit uRelCanVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRelGenerico, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, RLFilters,
  RLPDFFilter, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TfrmExtorno = class(TfrmGenerico)
    QryMasterpreVendaId: TFDAutoIncField;
    QryMasterclienteId: TIntegerField;
    QryMasternome: TStringField;
    QryMasterdataEmissao: TSQLTimeStampField;
    QryMastertotalVenda: TBCDField;
    QryMasterstatus: TStringField;
    QryDetalhespreVendaId: TIntegerField;
    QryDetalhesprodutoId: TIntegerField;
    QryDetalhesnome: TStringField;
    QryDetalhesquantidade: TFMTBCDField;
    QryDetalhesvalorUnitario: TFMTBCDField;
    QryDetalhestotalProduto: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExtorno: TfrmExtorno;

implementation

{$R *.dfm}

end.
