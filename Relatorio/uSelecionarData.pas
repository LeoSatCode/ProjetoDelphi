unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
   Vcl.Buttons, System.DateUtils,cUsuarioLogado,uDTMConexao;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicio: TDateEdit;
    lblData: TLabel;
    lblData1: TLabel;
    edtDataDataFinal: TDateEdit;
    btn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

uses
  uTelaHeranca;

{$R *.dfm}

procedure TfrmSelecionarData.btn1Click(Sender: TObject);
begin

  if (edtDataDataFinal.Date) < (edtDataInicio.Date) then begin
    MessageDlg('Data Final não pode ser maior que a Data Início', mtInformation, [mbOK],0);
    edtDataInicio.SetFocus;
    Abort;
  end;

  if (edtDataDataFinal.Date=0) OR (edtDataInicio.Date=0) then begin
    MessageDlg('Data Início ou Final são campos obrigatórios', mtInformation,[mbOk],0);
    edtDataInicio.SetFocus;
    Abort;
  end;

  {Close;}
  //Ou
  ModalResult := mrOk;
end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  edtDataInicio.Date      :=StartOfTheMonth(Date);
  edtDataDataFinal.Date   :=EndOfTheMonth(Date);
end;

end.
