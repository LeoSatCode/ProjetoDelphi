unit uCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.IniFiles, uDTMVenda,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnum,cProVendas, cRelatorio, cCaixa,
  uDTMConexao, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, System.UITypes;

type
  TfrmCaixa = class(TForm)
    PageControl1: TPageControl;
    Pendentes: TTabSheet;
    Faturados: TTabSheet;
    pnl2: TPanel;
    btnReceber: TBitBtn;
    QryPendentes: TFDQuery;
    QryPendentespreVendaId: TFDAutoIncField;
    QryPendentesclienteId: TIntegerField;
    QryPendentesnome: TStringField;
    QryPendentesdataEmissao: TSQLTimeStampField;
    QryPendentestotalVenda: TFMTBCDField;
    QryPendentesstatus: TStringField;
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
    strngfldQryPendentesdocumento: TStringField;
    strngfldQryFaturadosdocumento: TStringField;
    pnlListagemTopo: TPanel;
    lblIndice: TLabel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TBitBtn;
    pnlListagemTopo1: TPanel;
    lblIndice1: TLabel;
    medt1: TMaskEdit;
    btnPesquisar1: TBitBtn;
    gdrPendentes: TDBGrid;
    gdrFaturados: TDBGrid;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    procedure btnReceberClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskPesquisarChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure gdrPendentesTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gdrPendentesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gdrFaturadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
    dtmVendas:TdtmVenda;
    SelectOriginal:String;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure CentralizarTituloGrid(Grid: TDBGrid);
    procedure ZebrarGrid(Grid: TDBGrid; State: TGridDrawState; Column: TColumn; Rect: TRect);
  public
    { Public declarations }
    IndiceAtual:string;
  end;

var
  frmCaixa: TfrmCaixa;

implementation

uses
  uPrincipal, cUsuarioLogado,cFuncao, uRelProVenda;

{$R *.dfm}


procedure TfrmCaixa.btnReceberClick(Sender: TObject);
var oCaixa: TCaixa;
begin
  // Validação básica: tem pedido selecionado no grid?
  if QryPendentes.IsEmpty then
  begin
    MessageDlg('Selecione uma pré-venda na lista para receber!', mtWarning, [mbOK], 0);
    Exit; // Sai da rotina sem fazer nada
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

procedure TfrmCaixa.btnCancelarClick(Sender: TObject);
var oCaixa:TCaixa;
begin
  if QryPendentes.IsEmpty then
  begin
    MessageDlg('Selecione uma pré-venda na lista para cancelar!', mtWarning, [mbOK], 0);
    Exit; // Sai da rotina sem fazer nada
  end;

  oCaixa := TCaixa.Create(dtmConexao.ConexaoDB);
  try
    if oCaixa.CancelarVenda(QryPendentes.FieldByName('preVendaId').AsInteger) then
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
  ZebrarGrid(gdrFaturados, State, Column, Rect);
end;

procedure TfrmCaixa.gdrPendentesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  ZebrarGrid(gdrPendentes, State, Column, Rect);
end;

procedure TfrmCaixa.gdrPendentesTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryPendentes.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice); //Aqui o Label recebe o Campo Traduzido com o Indice Atual
end;

procedure TfrmCaixa.ZebrarGrid(Grid: TDBGrid; State:TGridDrawState; Column: TColumn; Rect: TRect);
var Linha: Integer;
begin
  if (gdFixed in State) then
  begin
    Grid.Canvas.Brush.Color := clGray;
    Grid.Canvas.FillRect(Rect);

    Exit;
  end;

  Linha := Grid.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    if (Linha mod 2) = 0 then
      Grid.Canvas.Brush.Color := clWebLightgrey
    else
      Grid.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    Grid.Canvas.Brush.Color := $00FFCC99;
    Grid.Canvas.Font.Color := clHighlightText;
  end;

  Grid.Canvas.FillRect(Rect);
  Grid.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);
end;

procedure SalvarGrid(Grid: TDBGrid; NomeSecao: string);
var
  I: Integer;
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'PreferenciasGridCaixa.ini');
  try
    for I := 0 to Grid.Columns.Count - 1 do
    begin
      ArquivoINI.WriteInteger(
        NomeSecao,
        'Coluna_' + IntToStr(I),
        Grid.Columns[I].Width);
    end;
  finally
    ArquivoINI.Free;
  end;
end;

procedure TfrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  SalvarGrid(gdrPendentes, oUsuarioLogado.nome + '_Pendentes');
  SalvarGrid(gdrFaturados, oUsuarioLogado.nome + '_Faturados');

  QryPendentes.Close;
  QryFaturados.Close;

  TFuncao.AtualizarDashBoard;
end;

procedure CarregarGrid(Grid: TDBGrid; NomeSecao: string);
var
  I: Integer;
  ArquivoINI: TIniFile;
begin
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'PreferenciasGridCaixa.ini');
  try
    for I := 0 to Grid.Columns.Count - 1 do
    begin
      Grid.Columns[I].Width:=
       ArquivoINI.ReadInteger(
        NomeSecao,
        'Coluna_' + IntToStr(I),
        Grid.Columns[I].Width);
    end;
  finally
    ArquivoINI.Free;
  end;
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

  CarregarGrid(gdrPendentes, oUsuarioLogado.nome + '_Pendentes');
  CarregarGrid(gdrFaturados, oUsuarioLogado.nome + '_Faturados');
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

procedure TfrmCaixa.mskPesquisarChange(Sender: TObject);
var Date:TDateTime;
    Texto, N: string;
    poscursor: Integer;
begin
  if(trim(TMaskEdit(Sender).Text) = '')then
    Exit;

  if IndiceAtual = 'documento' then begin
  PosCursor := mskPesquisar.SelStart;
  mskPesquisar.OnChange := nil;
  try
    N := TFuncao.SomenteNumeros(mskPesquisar.Text);
    Texto := N;

    if Length(N) <= 11 then
    begin
      if Length(N) > 3 then Texto := Copy(N,1,3) + '.' + Copy(N,4,Length(N)-3);
      if Length(N) > 6 then Texto := Copy(N,1,3) + '.' + Copy(N,4,3) + '.' + Copy(N,7,Length(N)-6);
      if Length(N) > 9 then Texto := Copy(N,1,3) + '.' + Copy(N,4,3) + '.' + Copy(N,7,3) + '-' + Copy(N,10,Length(N)-9);
    end
    else
    begin
      if Length(N) > 2 then Texto := Copy(N,1,2) + '.' + Copy(N,3,Length(N)-2);
      if Length(N) > 5 then Texto := Copy(N,1,2) + '.' + Copy(N,3,3) + '.' + Copy(N,6,Length(N)-5);
      if Length(N) > 8 then Texto := Copy(N,1,2) + '.' + Copy(N,3,3) + '.' + Copy(N,6,3) + '/' + Copy(N,9,Length(N)-8);
      if Length(N) > 12 then Texto := Copy(N,1,2) + '.' + Copy(N,3,3) + '.' + Copy(N,6,3) + '/' + Copy(N,9,4) + '-' + Copy(N,13,Length(N)-12);
    end;

    mskPesquisar.Text := Texto;
    mskPesquisar.SelStart := Length(Texto);
  finally
    mskPesquisar.OnChange := mskPesquisarChange;
  end;
  end;

  if(QryPendentes.FieldByName(IndiceAtual).DataType in [ftString, ftWideString] )then
  begin
    QryPendentes.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey])
  end

  else if(QryPendentes.FieldByName(IndiceAtual).DataType in [ftFloat, ftCurrency, ftFMTBcd]) then
  begin
    try
      QryPendentes.Locate(IndiceAtual, TMaskEdit(Sender).Text,[])
    except

    end;

  end

  else if(QryPendentes.FieldByName(IndiceAtual).DataType in [ftDate, ftDateTime, ftTimeStamp] )then
  begin
    if TryStrToDate(TMaskEdit(Sender).Text, Date) then
    begin
      QryPendentes.Locate(IndiceAtual, Date, []);
    end;

  end

  else
    QryPendentes.Locate(IndiceAtual, TMaskEdit(Sender).Text, [])
end;

procedure TfrmCaixa.btnPesquisarClick(Sender: TObject);
var I:Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd: string;
    CondicaoSQL: string;
begin

  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
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
