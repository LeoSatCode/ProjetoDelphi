unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uEnum, PngBitBtn, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmAlterarSenha = class(TForm)
    edtSenhaAtual: TEdit;
    edtNovaSenha: TEdit;
    Label2: TLabel;
    edtSenhaNovamente: TEdit;
    lblUsuarioLogado: TLabel;
    pnlFechar: TPanel;
    imgj4: TImage;
    PngBitBtn1: TPngBitBtn;
    pnlAlterar: TPanel;
    imgss: TImage;
    Image1: TImage;
    lbl1: TLabel;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure pnlFecharClick(Sender: TObject);
    procedure pnlAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnTabEnter(Sender: TObject);
    procedure OnTabExit(Sender: TObject);
    procedure OnMouseEnter(Sender: TObject);
    procedure OnMouseLeave(Sender: TObject);
  private
    { Private declarations }
    procedure LimparEdits;
    //oSenha:TSenha
    //function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

uses uDTMConexao, uPrincipal, cCadUsuario;

{$R *.dfm}

procedure TfrmAlterarSenha.pnlAlterarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  if (edtSenhaAtual.Text=oUsuarioLogado.senha) then begin
    if (edtNovaSenha.Text=edtSenhaNovamente.Text) then begin
      try
        oUsuario:=TUsuario.Create(dtmConexao.ConexaoDB);
        oUsuario.codigo         := oUsuarioLogado.codigo;
        oUsuario.senha          :=edtNovaSenha.Text;
        oUsuario.AlterarSenha;
        oUsuarioLogado.senha    :=edtNovaSenha.Text;
        MessageDlg('Senha Alterada com sucesso.', mtInformation, [mbOK],0);
        LimparEdits;
      finally
        FreeAndNil(oUsuario);
      end;
    end
    else begin
      MessageDlg('As Senhas não concidem.', mtInformation,[mbOK], 0);
      edtNovaSenha.SetFocus;
    end;
  end
  else begin
    MessageDlg('Senha Atual está inválida.', mtInformation, [mbOK],0);
  end;
end;

procedure TfrmAlterarSenha.pnlFecharClick(Sender: TObject);
begin
  Close;
end;



procedure TfrmAlterarSenha.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    pnlFecharClick(pnlFechar);
  end;

  if Key = VK_RETURN then
  begin
    pnlAlterarClick(pnlAlterar);
  end;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
  LimparEdits;
end;

{function TfrmAlterarSenha.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EstadoDoCadastro=ecInserir then
     Result:= oSenha.Inserir
  else if EstadoDoCadastro=ecAlterar then
     Result:= oSenha.Atualizar;
end;}

procedure TfrmAlterarSenha.LimparEdits;
begin
  edtSenhaAtual.Clear;
  edtNovaSenha.Clear;
  edtSenhaNovamente.Clear;
  lblUsuarioLogado.Caption:=oUsuarioLogado.nome; //Exibe o nome do usuário atual
end;

procedure TfrmAlterarSenha.OnMouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := $00D6E8FF;
  TPanel(Sender).Width := 111;
  TPanel(Sender).Height:= 25;
end;

procedure TfrmAlterarSenha.OnMouseLeave(Sender: TObject);
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


procedure TfrmAlterarSenha.OnTabEnter(Sender: TObject);
begin
  TPanel(Sender).BevelOuter := bvRaised;
  TPanel(Sender).Color := $0078AEEB;
end;

procedure TfrmAlterarSenha.OnTabExit(Sender: TObject);
begin
  TPanel(Sender).BorderStyle := bsNone;
  OnMouseLeave(Sender);
end;

end.
