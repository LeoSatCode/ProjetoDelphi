unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.IniFiles, uDTMVenda,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnum,cProVendas, cRelatorio, cCaixa, cPesquisar,
  uDTMConexao, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, System.UITypes,
  PngBitBtn, cGridUtils, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TfrmCaixa = class(TForm)
    PageControl1: TPageControl;
    Pendentes: TTabSheet;
    Faturados: TTabSheet;
    pnl2: TPanel;
    QryPendentes: TFDQuery;
    dtsPendentes: TDataSource;
    Panel2: TPanel;
    QryFaturados: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    SQLTimeStampField1: TSQLTimeStampField;
    FMTBCDField1: TFMTBCDField;
    StringField2: TStringField;
    dtsFaturados: TDataSource;
    strngfldQryFaturadosdocumento: TStringField;
    pnlListagemTopo: TPanel;
    lblIndice: TLabel;
    mskPesquisar: TMaskEdit;
    pnlListagemTopo1: TPanel;
    lblIndice1: TLabel;
    medt1: TMaskEdit;
    btnPesquisar1: TPngBitBtn;
    gdrPendentes: TDBGrid;
    gdrFaturados: TDBGrid;
    ilimage: TImageList;
    QryPendentespreVendaId: TFDAutoIncField;
    QryPendentesclienteId: TIntegerField;
    QryPendentesnome: TStringField;
    QryPendentessituacaoId: TIntegerField;
    QryPendentesdocumento: TStringField;
    QryPendentesdataEmissao: TSQLTimeStampField;
    QryPendentestotalVenda: TFMTBCDField;
    QryPendentesstatus: TStringField;
    pnlCancelar: TPanel;
    imgj: TImage;
    imgj1: TImage;
    pnlReceber: TPanel;
    imgq: TImage;
    pnlPesquisar: TPanel;
    imgj2: TImage;
    pnlExit: TPanel;
    imgj4: TImage;
    pnlExtornar: TPanel;
    Image1: TImage;
    pnlSair: TPanel;
    imgj41: TImage;
    procedure pnlReceberClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskPesquisarChange(Sender: TObject);
    procedure pnlPesquisarClick(Sender: TObject);
    procedure gdrPendentesTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gdrPendentesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gdrFaturadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnlExtornarClick(Sender: TObject);
    procedure pnlCancelarClick(Sender: TObject);
    procedure OnTabEnter(Sender: TObject);
    procedure OnTabExit(Sender: TObject);
    procedure OnMouseEnter(Sender: TObject);
    procedure OnMouseLeave(Sender: TObject);
    procedure pnlSairClick(Sender: TObject);
  private
    { Private declarations }
    dtmVendas:TdtmVenda;
    SelectOriginal:String;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure CentralizarTituloGrid(Grid: TDBGrid);
  public
    { Public declarations }
    IndiceAtual:string;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses
  uPrincipal, cUsuarioLogado,cFuncao, uRelProVenda, uRelCanVenda;

{$R *.dfm}


procedure TfrmCaixa.pnlReceberClick(Sender: TObject);
var oCaixa: TCaixa;
    vClienteId: Integer;
begin
  // Validação básica: tem pedido selecionado no grid?
  if QryPendentes.IsEmpty then
  begin
    MessageDlg('Selecione uma pré-venda na lista para receber!', mtWarning, [mbOK], 0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Exit; // Sai da rotina sem fazer nada
  end;

  if QryPendentes.FieldByName('situacaoId').AsInteger = 2 then
  begin
    MessageDlg('Não é possível receber. Cliente está BLOQUEADO.', mtWarning, [mbOK],0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Abort;
  end;

  // Instancia a classe de vendas conectada ao banco
  oCaixa := TCaixa.Create(dtmConexao.ConexaoDB);
  try
    // Chama a lógica de efetivação
    if oCaixa.FaturarVenda( QryPendentes.FieldByName('preVendaId').AsInteger ) then
    begin
      MessageDlg('Venda finalizada com sucesso! Estoque atualizado.', mtInformation, [mbOK], 0);

      TRel.MostrarRelatorio(Self, TfrmRelProVenda, oCaixa.VendaId);
      // Atualiza o grid pra sumir a venda que acabou de ser paga
      QryPendentes.Close;
      QryPendentes.Open;

      QryFaturados.Close;
      QryFaturados.Open;
    end
    else
    begin
      MessageDlg('Erro ao efetivar a venda. Chame o suporte!', mtError, [mbOK], 0);
    end;
  finally
    FreeAndNil(oCaixa);//Limpa a classe da memória
  end;

  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCaixa.pnlSairClick(Sender: TObject);
begin
  Close;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCaixa.pnlCancelarClick(Sender: TObject);
var oCaixa:TCaixa;
begin
  if QryPendentes.IsEmpty then
  begin
    MessageDlg('Selecione uma pré-venda na lista para cancelar!', mtWarning, [mbOK], 0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Exit; // Sai da rotina sem fazer nada
  end;

  oCaixa := TCaixa.Create(dtmConexao.ConexaoDB);
  try
    if oCaixa.CancelarPreVenda(QryPendentes.FieldByName('preVendaId').AsInteger) then
    begin
      MessageDlg('Venda cancelada com sucesso!', mtInformation, [mbOK], 0);

      QryPendentes.Close;
      QryPendentes.Open;

      QryFaturados.Close;
      QryFaturados.Open;
    end;
  finally
    FreeAndNil(oCaixa);
  end;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCaixa.pnlExtornarClick(Sender: TObject);
var oCaixa:TCaixa;
begin
  if QryFaturados.IsEmpty then
  begin
    MessageDlg('Selecione uma venda do tipo PAGO na lista para extornar!', mtWarning, [mbOK], 0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Exit; // Sai da rotina sem fazer nada
  end;

  oCaixa := TCaixa.Create(dtmConexao.ConexaoDB);
  try

    if MessageDlg('Deseja extornar essa venda?', mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      if oCaixa.ExtornarVenda(QryFaturados.FieldByName('preVendaId').AsInteger) then
      begin
        MessageDlg('Venda extornada com sucesso!Estoque atualizado.', mtInformation, [mbOK], 0);

        TRel.MostrarRelatorio(Self, TfrmExtorno, oCaixa.VendaId);
        QryFaturados.Close;
        QryFaturados.Open;
      end;
    end;
  finally
    FreeAndNil(oCaixa);
  end;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCaixa.btnSairClick(Sender: TObject);
begin
  Close;
  TFuncao.AtualizarDashBoard;
end;


{$REGION 'Pesquisa e Grid'}
procedure TfrmCaixa.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

procedure TfrmCaixa.gdrFaturadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TGrid.ZebrarGrid(gdrFaturados, State, Column,QryFaturados, Rect, ilimage, DataCol);
end;

procedure TfrmCaixa.gdrPendentesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TGrid.ZebrarGrid(gdrPendentes, State, Column, QryPendentes, Rect, ilimage, DataCol);
end;

procedure TfrmCaixa.gdrPendentesTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryPendentes.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice); //Aqui o Label recebe o Campo Traduzido com o Indice Atual
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  TGrid.SalvarGrid(gdrPendentes,'PreferenciasGridCaixa.ini',oUsuarioLogado.nome, Self.ClassName);
  TGrid.SalvarGrid(gdrFaturados,'PreferenciasGridCaixa.ini',oUsuarioLogado.nome, Self.ClassName);

  QryPendentes.Close;
  QryFaturados.Close;

  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCaixa.FormShow(Sender: TObject);
begin
  if (QryPendentes.SQL.Text<>EmptyStr) then begin
    QryPendentes.IndexFieldNames:=IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    SelectOriginal:=QryPendentes.SQL.Text;
    QryPendentes.Open;
  end;

  QryPendentes.Open;
  QryFaturados.Open;

  TGrid.CarregarGrid(gdrPendentes,'PreferenciasGridCaixa.ini',oUsuarioLogado.nome, Self.ClassName);
  TGrid.CarregarGrid(gdrFaturados,'PreferenciasGridCaixa.ini',oUsuarioLogado.nome, Self.ClassName);
end;

procedure TfrmCaixa.CentralizarTituloGrid(Grid: TDBGrid);
var I: Integer;
begin
  for I :=0 to Grid.Columns.Count -1 do
    Grid.Columns[I].Title.Alignment := taCenter;
end;

procedure TfrmCaixa.FormCreate(Sender: TObject);
begin
  CentralizarTituloGrid(gdrPendentes);
  CentralizarTituloGrid(gdrFaturados);
end;

procedure TfrmCaixa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    pnlSairClick(pnlExit);
  end;
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmCaixa.mskPesquisarChange(Sender: TObject);
begin
  TPesquisa.PesquisaCampo(Sender,mskPesquisar,QryPendentes,IndiceAtual);
end;

procedure TfrmCaixa.OnMouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := $00D6E8FF;
  TPanel(Sender).Width := 111;
  TPanel(Sender).Height:= 25;
end;

procedure TfrmCaixa.OnMouseLeave(Sender: TObject);
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

procedure TfrmCaixa.OnTabEnter(Sender: TObject);
begin
  TPanel(Sender).BevelOuter := bvRaised;
  TPanel(Sender).Color := $0078AEEB;
end;

procedure TfrmCaixa.OnTabExit(Sender: TObject);
begin
  TPanel(Sender).BorderStyle := bsNone;
  OnMouseLeave(Sender);
end;

procedure TfrmCaixa.pnlPesquisarClick(Sender: TObject);
var I:Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd: string;
    CondicaoSQL: string;
begin

  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPngBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;
  if mskPesquisar.Text='' then
  begin
    QryPendentes.Close;
    QryPendentes.SQL.Clear;
    QryPendentes.SQL.Add(SelectOriginal);
    QryPendentes.Open;
    Abort;
  end;

  for I := 0 to QryPendentes.FieldCount-1 do
  begin
    if QryPendentes.Fields[i].FieldName=IndiceAtual then
    begin
      TipoCampo := QryPendentes.Fields[i].DataType;
      NomeCampo := QryPendentes.Fields[i].FieldName;
      Break;
    end;
  end;

  if LowerCase(NomeCampo) = 'clienteid' then
  begin
    NomeCampo := 'pv.clienteId';
  end;

  if Pos('where',LowerCase(SelectOriginal)) > 1 then
  begin
    WhereOrAnd := ' and '
  end
  else
  begin
    WhereOrAnd := ' where ';
  end;


  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
  begin
    CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisar.Text+'%');
  end

  else if (TipoCampo in [ftInteger, ftSmallint, ftAutoInc]) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisar.Text;
  end

  else if (TipoCampo in [ftFloat, ftCurrency, ftFMTBcd]) then
  begin
   CondicaoSQl := WhereOrAnd+''+NomeCampo + '='+StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
  end

  else if (TipoCampo in [ftDate, ftDateTime, ftTimeStamp]) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisar.Text)
  end;


  QryPendentes.Close;
  QryPendentes.SQL.Clear;
  QryPendentes.SQL.Add(SelectOriginal);
  QryPendentes.SQL.Add(CondicaoSQL);
  QryPendentes.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

procedure TfrmCaixa.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

function TfrmCaixa.RetornarCampoTraduzido(Campo:String):String;
var i:Integer; //Nosso "I" do tipo Int
begin
  for I := 0 to QryPendentes.Fields.Count-1 do begin // Para cada "I" (indice) que for igual a 0 faça (percorra)...
    if LowerCase(QryPendentes.Fields[i].FieldName)=LowerCase(Campo) then  begin  //Se o campo da QryPendentes ter um FieldName = Campo
      Result:= QryPendentes.Fields[i].DisplayLabel; // Retorne o campo da QryListagem no DisplayLabel
      Break; //Para a execução. *Bem parecido com o While do Python
    end;
  end;

end;

{$ENDREGION}
end.
