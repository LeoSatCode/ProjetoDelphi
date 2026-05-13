unit uConOrcVen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  PngBitBtn, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmConOrcVen = class(TfrmTelaHerancaConsulta)
    QryListagempreVendaId: TFDAutoIncField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TStringField;
    QryListagemsituacaoId: TIntegerField;
    QryListagemdocumento: TStringField;
    QryListagemdataEmissao: TSQLTimeStampField;
    QryListagemtotalVenda: TFMTBCDField;
    QryListagemstatus: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConOrcVen: TfrmConOrcVen;

implementation

{$R *.dfm}

end.
