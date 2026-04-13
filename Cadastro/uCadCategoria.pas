unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uDTMConexao, cCadCategoria, uEnum;

type
  TfrmCadCategoria = class(TfrmTelaHeranca)
    fieldsQryListagemcategoriaId: TFDAutoIncField;
    fieldsQryListagemdescricao: TStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    oCategoria:TCategoria;
    function Excluir:Boolean; override;
    function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then begin
    edtCategoriaId.Text:=IntToStr(oCategoria.codigo);
    edtDescricao.Text :=oCategoria.descricao;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmCadCategoria.btnPesquisarClick(Sender: TObject);
begin
  inherited;

end;

{$REGION 'OVERRIDES'}
function TfrmCadCategoria.Excluir: Boolean;
begin
  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then begin
     Result:=oCategoria.Apagar;
  end;

end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtCategoriaId.Text<>EmptyStr then
     oCategoria.codigo:=StrToInt(edtCategoriaId.Text)
  else
     oCategoria.codigo:=0;

  oCategoria.descricao:=edtDescricao.Text;

  if (EstadoDoCadastro=ecInserir) then
    Result:=oCategoria.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result:=oCategoria.Atualizar;
end;
{$ENDREGION}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategoria) then FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
begin
  inherited; // Herda todas as características da Classe Pai
  Ocategoria:=TCategoria.Create(dtmConexao.ConexaoDB);
  IndiceAtual:='descricao';
end;

end.
