unit uConCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHerancaConsulta, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, uDTMVenda;

type
  TfrmConCliente = class(TfrmTelaHerancaConsulta)
    QryListagemclienteId: TFDAutoIncField;
    QryListagemnome: TStringField;
    QryListagemdocumento: TStringField;
    QryListagemsituacaoId: TIntegerField;
    QryListagemtelefone: TStringField;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    QryListagemobservacao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
    dtmVendas:TdtmVenda;
    procedure AbrirCadastroCliente(AClienteId: Integer);
  public
    { Public declarations }
  end;

var
  frmConCliente: TfrmConCliente;

implementation

uses uCadCliente, uProVenda;

{$R *.dfm}



procedure TfrmConCliente.AbrirCadastroCliente(AClienteId: Integer);
begin
if not Assigned(frmCadCliente) then
    frmCadCliente := TfrmCadCliente.Create(nil);

  frmCadCliente.Show;
  frmCadCliente.BringToFront;

  // Carregar o cliente automaticamente
  frmCadCliente.QryListagem.Close;
  frmCadCliente.QryListagem.Open;
  frmCadCliente.QryListagem.Locate('clienteId', AClienteId, []);

  frmCadCliente.btnAlterar.Click;
end;

procedure TfrmConCliente.FormCreate(Sender: TObject);
begin
  inherited;
  aCampoId    :='clienteId';
  IndiceAtual :='nome';
end;

procedure TfrmConCliente.grdPesquisaDblClick(Sender: TObject);
var Observacao:string;
begin
   inherited;
   aRetornarIdSelecionado := QryListagemclienteId.AsInteger;
   ModalResult := mrOk;

end;

end.
