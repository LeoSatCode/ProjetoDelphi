unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uEnum;

type
  TfrmAlterarSenha = class(TForm)
    lbl1: TLabel;
    edtSenhaAtual: TEdit;
    Label1: TLabel;
    edtNovaSenha: TEdit;
    Label2: TLabel;
    edtSenhaNovamente: TEdit;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    lblUsuarioLogado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
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

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
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

procedure TfrmAlterarSenha.btnFecharClick(Sender: TObject);
begin
  Close;
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

end.
