unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,cAcaoAcesso, uEnum, uDTMConexao, System.ImageList, Vcl.ImgList;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    edtAcaoAcessoId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    QryListagemacaoAcessoId: TFDAutoIncField;
    QryListagemdescricao: TStringField;
    QryListagemchave: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso:TAcaoAcesso;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;override;
    function Excluir:Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

{ TfrmCadAcaoAcesso }

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
    edtAcaoAcessoId.Text  :=oAcaoAcesso.codigo.ToString; //Ao inves de IntToStr(oAcaoAcesso.codigo);
    edtDescricao.Text     :=oAcaoAcesso.descricao;
    edtChave.Text         :=oAcaoAcesso.chave;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;

end;

procedure TfrmCadAcaoAcesso.btnGravarClick(Sender: TObject);
begin
  if edtAcaoAcessoId.Text<>EmptyStr then
     oAcaoAcesso.codigo:=StrToInt(edtAcaoAcessoId.Text)
  else
     oAcaoAcesso.codigo:=0;

  oAcaoAcesso.descricao :=edtDescricao.Text;
  oAcaoAcesso.chave     :=edtChave.Text;

  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then begin
    MessageDlg('Chave já cadastrada', mtInformation, [mbOK],0);
    edtChave.SetFocus;
    Abort;
  end;

  inherited;

end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmCadAcaoAcesso.Excluir: Boolean;
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     Result:=oAcaoAcesso.Apagar;
  end;
end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoAcesso) then FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso:=TAcaoAcesso.Create(dtmConexao.ConexaoDB);
  IndiceAtual:='descricao';
end;

function TfrmCadAcaoAcesso.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if EstadoDoCadastro=ecInserir then
    Result:= oAcaoAcesso.Inserir
  else if EstadoDoCadastro=ecAlterar then
    Result:= oAcaoAcesso.Atualizar;
end;

end.
