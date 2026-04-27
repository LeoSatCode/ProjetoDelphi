unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, RxToolEdit, RxCurrEdit, cCadProduto, uEnum, uDTMConexao, cFuncao, uCadCategoria, uConCategoria,
  Vcl.Menus, System.ImageList, Vcl.ImgList, PngBitBtn;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    fdtncfldQryListagemprodutoId: TFDAutoIncField;
    strngfldQryListagemnome: TStringField;
    strngfldQryListagemdescricao: TStringField;
    fmtbcdfldQryListagemvalor: TFMTBCDField;
    fmtbcdfldQryListagemquantidade: TFMTBCDField;
    QryListagemcategoriaId: TIntegerField;
    strngfldQryListagemDescricaoCategoria: TStringField;
    edtProdutoId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    lblDescricao: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    fdtncfldQryCategoriacategoriaId: TFDAutoIncField;
    strngfldQryCategoriadescricao: TStringField;
    lblDescricao1: TLabel;
    btnIncluirCategoria: TSpeedButton;
    btnPesquisarCategoria: TSpeedButton;
    pnlImage: TPanel;
    ppmImage: TPopupMenu;
    CarregarImagem1: TMenuItem;
    LimparImagem1: TMenuItem;
    QryListagemfoto: TBlobField;
    pnlImage1: TPanel;
    imgProduto: TImage;
    imgImage: TImage;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirCategoriaClick(Sender: TObject);
    procedure btnPesquisarCategoriaClick(Sender: TObject);
    procedure LimparImagem1Click(Sender: TObject);
    procedure CarregarImagem1Click(Sender: TObject);
    procedure dtsListagemDataChange(Sender: TObject; Field: TField);
    procedure imgImageClick(Sender: TObject);
  private
    { Private declarations }
    oProduto:TProduto;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses uPrincipal;

{$R *.dfm}

{ TfrmCadProduto }

{$REGION 'Override'}

function TfrmCadProduto.Excluir:Boolean;
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
     Result:=oProduto.Apagar;
  end;
end;

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro):Boolean;
begin
  with oProduto do begin
  if edtProdutoId.Text<>EmptyStr then
     codigo:=StrToInt(edtProdutoId.Text)
  else
     codigo:=0;

  nome            :=edtNome.Text;
  descricao       :=edtDescricao.Text;
  categoriaId     :=lkpCategoria.KeyValue;
  valor           :=edtValor.Value;
  quantidade      :=edtQuantidade.Value;


  if imgImage.Picture.Bitmap.Empty then
     oProduto.foto.Assign(nil)
  else
     oProduto.foto.Assign(imgImage.Picture);

  if (EstadoDoCadastro=ecInserir) then
  begin
     Result:=oProduto.Inserir;
     ShowMessage('Inserido');
  end
  else if (EstadoDoCadastro=ecAlterar) then
  begin
     Result:=oProduto.Atualizar;
     ShowMessage('Alterado');
  end
  end
end ;

procedure TfrmCadProduto.imgImageClick(Sender: TObject);
var seta: TPoint;
begin
  inherited;
  GetCursorPos(seta);
    if Assigned(ppmImage) then
    begin
      ppmImage.Popup(seta.X, seta.Y);
    end;

end;

procedure TfrmCadProduto.LimparImagem1Click(Sender: TObject);
begin
  inherited;
  TFuncao.LimparImagem(imgImage);
end;

{$ENDREGION}

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProduto.btnPesquisarCategoriaClick(Sender: TObject);
begin
  inherited;
  try
    frmConCategoria :=TfrmConCategoria.Create(Self);

    if lkpCategoria.KeyValue<>null then
       frmConCategoria.aIniciarPesquisaId:=lkpCategoria.KeyValue;

    frmConCategoria.ShowModal;

    if frmConCategoria.aRetornarIdSelecionado<>Unassigned then
       lkpCategoria.KeyValue:=frmConCategoria.aRetornarIdSelecionado;
   finally
    frmConCategoria.Release;
  end;
end;

procedure TfrmCadProduto.CarregarImagem1Click(Sender: TObject);
begin
  inherited;
  TFuncao.CarregarImagem(imgImage);
end;

procedure TfrmCadProduto.dtsListagemDataChange(Sender: TObject; Field: TField);
var
  BlobField: TBlobField;
  Stream: TMemoryStream;
begin
  if not dtsListagem.DataSet.Active then Exit;

  if (dtsListagem.DataSet.FieldByName('foto') = nil) or
     dtsListagem.DataSet.FieldByName('foto').IsNull then
  begin
    imgProduto.Picture := nil;

    pnlImage1.Visible := False;

    gdrListagem.Align := alClient;
  end
  else
  begin
    pnlImage1.Visible := True;

    pnlImage1.Align := alRight;
    pnlImage1.Width := 200;

    gdrListagem.Align := alClient;

    BlobField := dtsListagem.DataSet.FieldByName('foto') as TBlobField;
    Stream := TMemoryStream.Create;
    try
      BlobField.SaveToStream(Stream);
      Stream.Position := 0;
      imgProduto.Picture.Bitmap.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end;
end;

procedure TfrmCadProduto.btnIncluirCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmConexao.ConexaoDB);
  QryCategoria.Refresh;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then begin
    with oProduto do begin
    edtProdutoId.Text       :=IntToStr(codigo);
    edtNome.Text            :=nome;
    edtDescricao.Text       :=descricao;
    lkpCategoria.KeyValue   :=categoriaId;
    edtValor.Value          :=valor;
    edtQuantidade.Value     :=quantidade;
    imgImage.Picture.Assign(oProduto.foto);
    end;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;
  inherited;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  if Assigned(oProduto) then FreeAndNil(oProduto);
end;
procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto:=TProduto.Create(dtmConexao.ConexaoDB);

  IndiceAtual:='nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  QryCategoria.Open;
end;

end.
