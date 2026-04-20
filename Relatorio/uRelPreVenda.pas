unit uRelPreVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRelGenerico, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, RLFilters, RLPDFFilter, FireDAC.Comp.Client, RLReport;

type
  TfrmRelPreVenda = class(TfrmGenerico)
    QryMasterpreVendaId: TFDAutoIncField;
    QryMasterClienteId: TIntegerField;
    QryMasternome: TStringField;
    QryMasterdataEmissao: TSQLTimeStampField;
    QryMastertotalVenda: TBCDField;
    QryDetalhespreVendaId: TIntegerField;
    QryDetalhesprodutoId: TIntegerField;
    QryDetalhesNome: TStringField;
    QryDetalhesquantidade: TFMTBCDField;
    QryDetalhesvalorUnitario: TFMTBCDField;
    QryDetalhestotalProduto: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPreVenda: TfrmRelPreVenda;

implementation

{$R *.dfm}

end.
