unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uDTMConexao, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    img2: TImage;
    lblUSUÁRIO: TLabel;
    lbl1: TLabel;
    btnFechar: TBitBtn;
    btnLogin: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lbl2: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    bFechar: Boolean;
    FTrocaUsuario: Boolean;
    procedure FecharFormulario;
    procedure FecharAplicacao;
  public
    { Public declarations }
    property TrocaUsuario: Boolean read FTrocaUsuario write FTrocaUsuario;
  end;

var
  frmLogin: TfrmLogin;

implementation

uses cCadUsuario, uPrincipal;

{$R *.dfm}

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  if TrocaUsuario then
     FecharFormulario
  else
    FecharAplicacao;   // fecha a aplicação
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := True;
  ModalResult:= mrCancel;
end;

procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := True;
  Application.Terminate;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  try
    oUsuario:=TUsuario.Create(dtmConexao.ConexaoDB);
    if oUsuario.Login(edtUsuario.Text,edtSenha.Text)then begin
       oUsuarioLogado.codigo := oUsuario.codigo;
       oUsuarioLogado.nome   := oUsuario.nome;
       oUsuarioLogado.senha  := oUsuario.senha;
       bFechar := True;
       ModalResult := mrOk;
    end
    else begin
       MessageDlg('Usuário Invalido', mtConfirmation, [mbOK],0);
    end;

  finally
    if Assigned(oUsuario) then FreeAndNil(oUsuario);
  end;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
edtUsuario.SetFocus;
bFechar:=False;
end;

end.
