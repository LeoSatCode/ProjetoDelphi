unit uRelProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uRelGenerico, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, RLFilters, RLPDFFilter, FireDAC.Comp.Client, RLReport;

type
  TfrmRelProVenda = class(TfrmGenerico)
    QryMastervendaId: TFDAutoIncField;
    QryMasterClienteId: TIntegerField;
    QryMasternome: TStringField;
    QryMasterdataVenda: TSQLTimeStampField;
    QryMastertotalVenda: TBCDField;
    QryDetalhesvendaId: TIntegerField;
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
  frmRelProVenda: TfrmRelProVenda;

implementation

{$R *.dfm}

end.
