unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uDTMConexao,
  FireDAC.Comp.Client, uEnum, RxToolEdit, RxCurrEdit, cUsuarioLogado, System.ImageList, Vcl.ImgList, System.IniFiles, cFuncao,
  PngBitBtn, cGridUtils, Vcl.Imaging.pngimage;

type
  TfrmTelaHeranca = class(TForm)
    pnlRodape: TPanel;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    gdrListagem: TDBGrid;
    btnNavigator: TDBNavigator;
    QryListagem: TFDQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    ilimage: TImageList;
    pnlNovo: TPanel;
    img1sw: TImage;
    pnlAlterar: TPanel;
    imgss: TImage;
    pnlGravar: TPanel;
    imgq: TImage;
    pnlCancelar: TPanel;
    imgj: TImage;
    pnlApagar: TPanel;
    imgr: TImage;
    pnlFechar: TPanel;
    Image5: TImage;
    img6: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    pnlPesquisar: TPanel;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pnlFecharClick(Sender: TObject);
    procedure pnlNovoClick(Sender: TObject);
    procedure pnlCancelarClick(Sender: TObject);
    procedure pnlGravarClick(Sender: TObject);
    procedure pnlApagarClick(Sender: TObject);
    procedure pnlAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gdrListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure gdrListagemDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnlPesquisarClick(Sender: TObject);
    procedure gdrListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure OnMouseEnter(Sender: TObject);
    procedure OnMouseLeave(Sender: TObject);
    procedure OnTabEnter(Sender: TObject);
    procedure OnTabExit(Sender: TObject);

  private
    { Private declarations }
    SelectOriginal:String;
    procedure ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar,
              pnlGravar, pnlApagar:TPanel; Navegador:TDBNavigator;
              pgcPrincipal:TPageControl; Flag:Boolean);

    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: String): String;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
  public
    { Public declarations }
    IndiceAtual:string;
    EstadoDoCadastro:TEstadoDoCadastro;
    function Excluir:Boolean; virtual;
    function Gravar (EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
    function GetColumnByFieldName(Grid: TDBGrid; const AFieldName: string): TColumn;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);

  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation


{$R *.dfm}

uses uPrincipal;

{$REGION ' OBSERVAÇÕES'}
//TAG: 1 - Chave Primária - PK (Primary Key)
//TAG: 2 - Campos Obrigatórios
{$ENDREGION}

{$REGION ' FUNÇÕES E PROCEDURES '}
//Funções
function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:String):String;
var i:Integer; //Nosso "I" do tipo Int
begin
  for I := 0 to QryListagem.Fields.Count-1 do begin // Para cada "I" (indice) que for igual a 0 faça (percorra)...
    if LowerCase(QryListagem.Fields[i].FieldName)=LowerCase(Campo) then  begin  //Se o campo da QryListagem ter um FieldName = Campo
      Result:= QryListagem.Fields[i].DisplayLabel; // Retorne o campo da QryListagem no DisplayLabel
      Break; //Para a execução. *Bem parecido com o While do Python
    end;
  end;

end;

//Procedimentos de Controle de Tela
procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
      if (TLabeledEdit(Components[i]).Tag = 2) and
         (TLabeledEdit(Components[i]).Text=EmptyStr) then begin
         MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption +
                   ' é um campo obrigatório!', mtInformation, [mbOK], 0);
         TLabeledEdit(Components[i]).SetFocus;
         Result:=True;
         Break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
      if (TLabeledEdit(Components[i]).Tag = 1) then begin
         TLabeledEdit(Components[i]).Enabled:=False;
         Break;
      end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then
        TLabeledEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TEdit) then
        TEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TMaskEdit) then
        TMaskEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TMemo) then
        TMemo(Components[i]).Text:=EmptyStr
    else if (Components[i] is TDBLookupComboBox) then
        TDBLookupComboBox(Components[i]).KeyValue:=Null
    else if (Components[i] is TCurrencyEdit) then
        TCurrencyEdit(Components[i]).Value:=0
    else if (Components[i] is TDateEdit) then
        TDateEdit(Components[i]).Date:=0
    else if (Components[i] is TImage) then
        TImage(Components[i]).Picture:=nil;
  end;
end;

{$ENDREGION}

{$REGION 'MÉTODOS VURTUAIS'}
function TfrmTelaHeranca.Excluir: Boolean;
begin
  ShowMessage('DELETADO');
  Result := True;
end;

function TfrmTelaHeranca.GetColumnByFieldName(Grid: TDBGrid; const AFieldName: string): TColumn;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    if SameText(Grid.Columns[I].FieldName, AFieldName) then
      Exit(Grid.Columns[I]);
  end;

end;

function TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;
begin
    Result := True;
end;

{$ENDREGION}

procedure TfrmTelaHeranca.ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar,
          pnlGravar, pnlApagar:TPanel; Navegador:TDBNavigator;
          pgcPrincipal:TPageControl; Flag:Boolean);

  // Criamos uma procedure interna (Sub-rotina) só para trocar o visual e estado!
  procedure MudarVisualPainel(Painel: TPanel; Img: TImage; Ativo: Boolean);
  begin
    Painel.Enabled := Ativo;
    Img.Enabled := Ativo;

    if Ativo then
    begin
      Painel.Color := clWhite;
      Img.Visible := True;
      Painel.Font.Color := clBlack;
    end
    else
    begin
      Painel.Color := $00EBE2DA;
      Img.Visible := False;
      Painel.Font.Color := $006B6B6B;

      Painel.Width := 109;
      Painel.Height := 23;
    end;
  end;

begin

  MudarVisualPainel(pnlNovo, img6, Flag);
  MudarVisualPainel(pnlApagar, Image4, Flag);
  MudarVisualPainel(pnlAlterar, Image1, Flag);

  MudarVisualPainel(pnlCancelar, Image3, not Flag);
  MudarVisualPainel(pnlGravar, Image2, not Flag);

  Navegador.Enabled := Flag;
  pgcPrincipal.Pages[0].TabVisible := Flag;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;
end;

procedure TfrmTelaHeranca.pnlNovoClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPanel(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar, pnlGravar, pnlApagar,
                  btnNavigator, pgcPrincipal,False);

  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;


procedure TfrmTelaHeranca.pnlPesquisarClick(Sender: TObject);
var I:Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd: string;
    CondicaoSQL: string;
begin

  if mskPesquisar.Text='' then
  begin
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    Abort;
  end;

  for I := 0 to QryListagem.FieldCount-1 do
  begin
    if QryListagem.Fields[i].FieldName=IndiceAtual then
    begin
      TipoCampo := QryListagem.Fields[i].DataType;
      NomeCampo := QryListagem.Fields[i].Origin;
      if Trim(NomeCampo) = '' then
        NomeCampo := QryListagem.Fields[i].FieldName;
      Break;
    end;
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


  QryListagem.Close;
  QryListagem.SQL.Clear;
  QryListagem.SQL.Add(SelectOriginal);
  QryListagem.SQL.Add(CondicaoSQL);
  //ShowMessage(QryListagem.SQL.Text);
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

procedure TfrmTelaHeranca.pnlAlterarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPanel(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  if QryListagem.IsEmpty then
  begin
    MessageDlg('Não há registros para serem alterados.', mtWarning, [mbOK], 0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Exit;
  end;

  ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar, pnlGravar, pnlApagar,
                  btnNavigator, pgcPrincipal,False);
  EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.pnlApagarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPanel(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  if QryListagem.IsEmpty then
  begin
    MessageDlg('Não há registros para serem deletados.', mtWarning, [mbOK], 0);
    TPanel(Sender).Color := clWhite;
    TPanel(Sender).Width := 109;
    TPanel(Sender).Height:= 23;
    Exit;
  end;

  try
    if (Excluir) then begin
      ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar, pnlGravar, pnlApagar,
                      btnNavigator, pgcPrincipal,True);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      QryListagem.Refresh;
    end
  finally
      EstadoDoCadastro:=ecNenhum;
  end;

end;

procedure TfrmTelaHeranca.pnlCancelarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPanel(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar, pnlGravar, pnlApagar,
                  btnNavigator, pgcPrincipal,True);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.pnlFecharClick(Sender: TObject);
begin
  Close;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmTelaHeranca.pnlGravarClick(Sender: TObject);
begin
    if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPanel(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  if (ExisteCampoObrigatorio) then Abort; //Quando é uma unica linha de instrução, não precisamos de begin e end

    //Podemos usar o Try, Finally e Catch para garantir o funcionamento do código.
  Try //Tenta executar o bloco de código abaixo
      if Gravar (EstadoDoCadastro) then begin
        ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar, pnlGravar, pnlApagar,
                        btnNavigator, pgcPrincipal,True);
        ControlarIndiceTab(pgcPrincipal, 0);
        EstadoDoCadastro:=ecNenhum;
        LimparEdits;
        QryListagem.Close;
        QryListagem.Open;
      end
      else begin
        MessageDlg('Erro na Gravação', mtError, [mbok], 0);
      end;
  Finally //Executa o EstadoDoCadastro independentemente do resultado do 'Try'

  End; //Finaliza a opereção

    TFuncao.AtualizarDashBoard;

end;

procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TGrid.SalvarGrid(gdrListagem,'PreferenciasGrid.ini', oUsuarioLogado.nome, Self.ClassName);

  QryListagem.Close;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
var I:Integer; //Variavel para percorrer a lista
begin

  SelectOriginal := QryListagem.SQL.Text;

  for I := 0 to gdrListagem.Columns.Count - 1 do
    gdrListagem.Columns[I].Title.Alignment := taCenter; //Percorre as colunas do grid e centraliza o titulo de cada uma

  QryListagem.Connection:=dtmConexao.ConexaoDB;
  dtsListagem.DataSet:=QryListagem;

  with gdrListagem do begin
    DataSource:=dtsListagem;
    Options:=[dgTitles,dgIndicator,dgColumnResize,
              dgColLines,dgRowLines,dgTabs,
              dgAlwaysShowSelection,
              dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
  end;
end;

procedure TfrmTelaHeranca.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = VK_ESCAPE then
  begin
    pnlFecharClick(pnlFechar);
  end;


  if (ActiveControl is TCustomEdit) or (ActiveControl is TCustomComboBox) then
    Exit;

  if (Shift = []) then
  begin
    case Key of
      Ord('N'):
        if pnlNovo.Enabled and Assigned(pnlNovo.OnClick) then
          pnlNovo.OnClick(pnlNovo);

      Ord('A'):
        if pnlAlterar.Enabled and Assigned(pnlAlterar.OnClick) then
          pnlAlterar.OnClick(pnlAlterar);

      Ord('G'):
        if pnlGravar.Enabled and Assigned(pnlGravar.OnClick) then
          pnlGravar.OnClick(pnlGravar);

      Ord('C'):
        if pnlCancelar.Enabled and Assigned(pnlCancelar.OnClick) then
          pnlCancelar.OnClick(pnlCancelar);

      Ord('D'):
        if pnlApagar.Enabled and Assigned(pnlApagar.OnClick) then
          pnlApagar.OnClick(pnlApagar);
    end;

    // Zera a tecla APENAS se foi uma das nossas letras, para não apitar erro no Windows
    if Key in [Ord('N'), Ord('A'), Ord('G'), Ord('C'), Ord('D')] then
      Key := 0;
  end;
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  TGrid.CarregarGrid(gdrListagem,'PreferenciasGrid.ini',oUsuarioLogado.nome, Self.ClassName);

  if (QryListagem.SQL.Text<>EmptyStr) then begin
    QryListagem.IndexFieldNames:=IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    SelectOriginal:=QryListagem.SQL.Text;
    QryListagem.Open;
  end;
    ControlarIndiceTab(pgcPrincipal, 0);
    DesabilitarEditPK;
    ControlarBotoes(pnlNovo, pnlAlterar, pnlCancelar,
                    pnlGravar, pnlApagar,
                    btnNavigator, pgcPrincipal,True);
  pnlNovo.SetFocus;
end;

procedure TfrmTelaHeranca.gdrListagemDblClick(Sender: TObject);
begin
  pnlAlterarClick(pnlAlterar);
end;

procedure TfrmTelaHeranca.gdrListagemDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  TGrid.ZebrarGrid(gdrListagem, State, Column, QryListagem, Rect, ilimage, DataCol);
end;

procedure TfrmTelaHeranca.gdrListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice); //Aqui o Label recebe o Campo Traduzido com o Indice Atual
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
var
  Date: TDateTime;
  N, Texto: string;
  PosCursor: Integer;
begin
  if Trim(TMaskEdit(Sender).Text) = '' then
    Exit;

  if (QryListagem.FieldByName(IndiceAtual).DataType in [ftDate, ftDateTime, ftTimeStamp]) then
  begin
    PosCursor := mskPesquisar.SelStart;
    mskPesquisar.OnChange := nil;
    try
      N := TFuncao.SomenteNumeros(mskPesquisar.Text);
      Texto := N;

      if Length(N) <= 8 then
      begin
        if Length(N) > 2 then
          Texto := Copy(N,1,2) + '/' + Copy(N,3,Length(N)-2);

        if Length(N) > 4 then
          Texto := Copy(N,1,2) + '/' + Copy(N,3,2) + '/' + Copy(N,5,Length(N)-4);
      end;

      mskPesquisar.MaxLength := 10;
      mskPesquisar.Text := Texto;
      mskPesquisar.SelStart := Length(Texto);
    finally
      mskPesquisar.OnChange := mskPesquisarChange;
    end;

    // Depois de formatar, tenta localizar
    if TryStrToDate(mskPesquisar.Text, Date) then
      QryListagem.Locate(IndiceAtual, Date, []);

    Exit; // importante pra não cair nos outros casos
  end;

  if (QryListagem.FieldByName(IndiceAtual).DataType in [ftString, ftWideString]) then
  begin
    QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
  end

  else if (QryListagem.FieldByName(IndiceAtual).DataType in [ftFloat, ftCurrency, ftFMTBcd]) then
  begin
    try
      QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, []);
    except
      // evita erro de conversão
    end;
  end

  else
  begin
    QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, []);
  end;
end;

procedure TfrmTelaHeranca.OnMouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := $00D6E8FF;
  TPanel(Sender).Width := 111;
  TPanel(Sender).Height:= 25;
end;

procedure TfrmTelaHeranca.OnMouseLeave(Sender: TObject);
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

procedure TfrmTelaHeranca.OnTabEnter(Sender: TObject);
begin
  TPanel(Sender).BevelOuter := bvRaised;
  TPanel(Sender).Color := $0078AEEB;
end;

procedure TfrmTelaHeranca.OnTabExit(Sender: TObject);
begin
  TPanel(Sender).BorderStyle := bsNone;
  OnMouseLeave(Sender);
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

end.


