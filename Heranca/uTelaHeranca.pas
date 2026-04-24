unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uDTMConexao,
  FireDAC.Comp.Client, uEnum, RxToolEdit, RxCurrEdit, cUsuarioLogado, System.ImageList, Vcl.ImgList, System.IniFiles, cFuncao,
  PngBitBtn;

type
  TfrmTelaHeranca = class(TForm)
    pnlRodape: TPanel;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisar: TPngBitBtn;
    gdrListagem: TDBGrid;
    btnNovo: TPngBitBtn;
    btnAlterar: TPngBitBtn;
    btnCancelar: TPngBitBtn;
    btnGravar: TPngBitBtn;
    btnApagar: TPngBitBtn;
    btnFechar: TPngBitBtn;
    btnNavigator: TDBNavigator;
    QryListagem: TFDQuery;
    dtsListagem: TDataSource;
    lblIndice: TLabel;
    ilimage: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gdrListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure gdrListagemDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure gdrListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

  private
    { Private declarations }
    SelectOriginal:String;
    procedure ControlarBotoes(bntNovo, bntAlterar, btnCancelar,
              btnGravar, btnApagar:TPngBitBtn; Navegador:TDBNavigator;
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
        TDateEdit(Components[i]).Date:=0;
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
  if (EstadoDoCadastro=ecInserir) then
    ShowMessage('Inserido')
  else if (EstadoDoCadastro=ecAlterar) then
    ShowMessage('Alterado');
    Result := True;
end;

{$ENDREGION}

procedure TfrmTelaHeranca.ControlarBotoes(bntNovo, bntAlterar, btnCancelar,
          btnGravar, btnApagar:TPngBitBtn; Navegador:TDBNavigator;
          pgcPrincipal:TPageControl; Flag:Boolean);
begin
  btnNovo.Enabled       :=Flag;
  btnApagar.Enabled     :=Flag;
  btnAlterar.Enabled    :=Flag;
  Navegador.Enabled     :=Flag;
  pgcPrincipal.Pages[0].TabVisible    :=Flag;
  btnCancelar.Enabled   :=not(Flag);
  btnGravar.Enabled     :=not(Flag);
end;

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal: TPageControl; Indice: Integer);
begin
  if (pgcPrincipal.Pages[Indice].TabVisible) then
      pgcPrincipal.TabIndex:=Indice;
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPngBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal,False);

  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;


procedure TfrmTelaHeranca.btnPesquisarClick(Sender: TObject);
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
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPngBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
    begin
      MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
      Abort;
    end;
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal,False);
  EstadoDoCadastro:=ecAlterar;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
   if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPngBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

  try
    if (Excluir) then begin
      ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                      btnNavigator, pgcPrincipal,True);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na Exclusão', mtError, [mbOK], 0)
    end;
  finally
      EstadoDoCadastro:=ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
                  btnNavigator, pgcPrincipal,True);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
     if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, Self.Name+'_'+TPngBitBtn(Sender).Name, dtmConexao.ConexaoDB) then
  begin
    MessageDlg('Usuário: '+oUsuarioLogado.nome+',não tem permissão de acesso.',mtInformation,[mbOK],0);
    Abort;
  end;

    if (ExisteCampoObrigatorio) then Abort; //Quando é uma unica linha de instrução, não precisamos de begin e end

    //Podemos usar o Try, Finally e Catch para garantir o funcionamento do código.
    Try //Tenta executar o bloco de código abaixo
      if Gravar (EstadoDoCadastro) then begin
        ControlarBotoes(btnNovo, btnAlterar, btnCancelar, btnGravar, btnApagar,
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
var ArquivoINI:TIniFile; // Variável para criar o arquivo INI para salvar preferências de Grid por usuário.
    I: Integer; // Ponteiro para passar por todas as colunas (pastas)
begin
  ExtractFilePath(Application.ExeName); // Garante que o INI fique na mesma pasta do .exe
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'PreferenciasGrid.ini'); //Criamos o INI File na pasta do .exe

  try
    for I := 0 to gdrListagem.Columns.Count - 1 do  // O laço percorre do 0 à ultima coluna desenhada no Grid
    begin
      ArquivoINI.WriteInteger(
      oUsuarioLogado.nome, // Usamos o UsuarioLogado para separar de quem é a preferência.
      'Coluna_' + IntToStr(I), // Nomeamos a pasta com o Indice da coluna.
      gdrListagem.Columns[I].Width); //A largura atual da coluna naquele exato segundo.
      ArquivoINI.WriteString(
      oUsuarioLogado.nome,
      'Ordem_' + IntToStr(I),
      gdrListagem.Columns[I].FieldName);
    end;
  finally
    ArquivoINI.Free;// Independentemente de dar erro ou não, sempre fechamos o caderninho para liberar a memória
  end;

  QryListagem.Close;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
var I:Integer; //Variavel para percorrer a lista
begin

  for I := 0 to gdrListagem.Columns.Count - 1 do
    gdrListagem.Columns[I].Title.Alignment := taCenter; //Percorre as colunas do grid e centraliza o titulo de cada uma

  QryListagem.Connection:=dtmConexao.ConexaoDB;
  dtsListagem.DataSet:=QryListagem;

  with gdrListagem do begin
    DataSource:=dtsListagem;
    Options:=[dgTitles,dgIndicator,dgColumnResize,
              dgColLines,dgRowLines,dgTabs,
              dgRowSelect,dgAlwaysShowSelection,
              dgCancelOnExit,dgTitleClick,dgTitleHotTrack];
  end;
end;

procedure TfrmTelaHeranca.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
var ArquivoINI: TIniFile ; //Referenciamos novamente nosso Arquivo
    I:Integer; //Passamos o ponteiro
    NomeCampo: string;
    Coluna: TColumn;
begin

   ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'PreferenciasGrid.ini');

  try
    gdrListagem.Columns.BeginUpdate;
    try

      for I := 0 to gdrListagem.Columns.Count - 1 do
      begin
        gdrListagem.Columns[I].Width :=
          ArquivoINI.ReadInteger(oUsuarioLogado.nome,
          'Coluna_' + IntToStr(I),
          gdrListagem.Columns[I].Width);
      end;


      for I := 0 to gdrListagem.Columns.Count - 1 do
      begin
        NomeCampo := ArquivoINI.ReadString(
          oUsuarioLogado.nome,
          'Ordem_' + IntToStr(I),
          ''
        );

        if NomeCampo <> '' then
        begin
          Coluna := GetColumnByFieldName(gdrListagem, NomeCampo);
          if Assigned(Coluna) then
            Coluna.Index := I;
        end;
      end;

    finally
      gdrListagem.Columns.EndUpdate;
    end;

  finally
    ArquivoINI.Free;
  end;
  if (QryListagem.SQL.Text<>EmptyStr) then begin
    QryListagem.IndexFieldNames:=IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    SelectOriginal:=QryListagem.SQL.Text;
    QryListagem.Open;
  end;
    ControlarIndiceTab(pgcPrincipal, 0);
    DesabilitarEditPK;
    ControlarBotoes(btnNovo, btnAlterar, btnCancelar,
                    btnGravar, btnApagar,
                    btnNavigator, pgcPrincipal,True);
end;

procedure TfrmTelaHeranca.gdrListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.gdrListagemDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  id: Integer;
  imgIndex: Integer;
begin
  inherited;

  // pinta o fundo (ANTES de qualquer desenho)

  gdrListagem.Canvas.Brush.Style := bsSolid; // o fundo será pintado com cor sólida

  if not (gdSelected in State) then //Verifica se a linha NÂO está selecionada
  begin
    if (QryListagem.RecNo mod 2 = 0) then // O numero é divisível por 2?
      gdrListagem.Canvas.Brush.Color := clWhite // Se for, pinta de branco
    else
      gdrListagem.Canvas.Brush.Color := $00F0F0F0; // Se não for, pinta de cinza claro
  end
  else
  begin
    gdrListagem.Canvas.Brush.Color := $00FFCC99; //Cor da linha selecionada azul Yzidro (acho kkkkkk)
  end;

  gdrListagem.Canvas.TextOut(
    Rect.Left + 2,
    Rect.Top + 2,
    Column.Field.AsString
  );

  gdrListagem.Canvas.FillRect(Rect); // Pinta o fundo da célula com a cor escolhida


  // AGORA decide o que desenhar

  if Column.FieldName = 'situacaoId' then
  begin
    id := QryListagem.FieldByName('situacaoId').AsInteger;

    case id of
      1: imgIndex := 1;
      2: imgIndex := 2;
      3: imgIndex := 0;
      4: imgIndex := 3;
      5: imgIndex := 4;
    else
      Exit; //Se não tiver ID válido, não desenha nada
    end;

    // Desenha a imagem centralizada na célula
    ilimage.Draw(
      gdrListagem.Canvas,
      Rect.Left + (Rect.Width - ilimage.Width) div 2,
      Rect.Top + (Rect.Height - ilimage.Height) div 2,
      imgIndex
    );
  end
  else
  begin
    // Outras colunas continuam com comportamento padrão
    gdrListagem.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmTelaHeranca.gdrListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice); //Aqui o Label recebe o Campo Traduzido com o Indice Atual
end;

procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
var Date:TDateTime;
begin
  if(trim(TMaskEdit(Sender).Text) = '')then
    Exit;

  if(QryListagem.FieldByName(IndiceAtual).DataType in [ftString, ftWideString] )then
  begin
    QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey])
  end

  else if(QryListagem.FieldByName(IndiceAtual).DataType in [ftFloat, ftCurrency, ftFMTBcd]) then
  begin
    try
      QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text,[])
    except

    end;

  end

  else if(QryListagem.FieldByName(IndiceAtual).DataType in [ftDate, ftDateTime, ftTimeStamp] )then
  begin
    if TryStrToDate(TMaskEdit(Sender).Text, Date) then
    begin
      QryListagem.Locate(IndiceAtual, Date, []);
    end;

  end

  else
    QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [])
end;

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

end.


