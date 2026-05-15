unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, PngBitBtn,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,uDTMConexao, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    img2: TImage;
    lblUSUÁRIO: TLabel;
    lbl1: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    lbl2: TLabel;
    pnlFechar: TPanel;
    imgj4: TImage;
    btnFechar: TPngBitBtn;
    pnlLogin: TPanel;
    imgq: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure pnlLoginClick(Sender: TObject);
    procedure OnTabEnter(Sender: TObject);
    procedure OnTabExit(Sender: TObject);
    procedure OnMouseEnter(Sender: TObject);
    procedure OnMouseLeave(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmLogin.pnlLoginClick(Sender: TObject);
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

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    pnlLoginClick(pnlLogin);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
edtUsuario.SetFocus;
bFechar:=False;
end;

procedure TfrmLogin.OnMouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := $00D6E8FF;
  TPanel(Sender).Width := 111;
  TPanel(Sender).Height:= 25;
end;

procedure TfrmLogin.OnMouseLeave(Sender: TObject);
var
  Painel: TPanel;
  PontoMouse: TPoint;
begin
  // Garante que quem chamou é o Painel
  if not (Sender is TPanel) then Exit;
  Painel := TPanel(Sender);

  // Pega a posição global do mouse (na tela do PC) e traduz para as coordenadas do Painel
  PontoMouse := Painel.ScreenToClient(Mouse.CursorPos);

  // Se a coordenada X e Y do mouse ainda estiver dentro do quadrado do Painel, aborta!
  if PtInRect(Painel.ClientRect, PontoMouse) then
    Exit;

  TPanel(Sender).Color := clWhite;
  TPanel(Sender).Width := 109;
  TPanel(Sender).Height:= 23;
end;

procedure TfrmLogin.OnTabEnter(Sender: TObject);
begin
  TPanel(Sender).BevelOuter := bvRaised;
  TPanel(Sender).Color := $0078AEEB;
end;

procedure TfrmLogin.OnTabExit(Sender: TObject);
begin
  TPanel(Sender).BorderStyle := bsNone;
  OnMouseLeave(Sender);
end;

end.
