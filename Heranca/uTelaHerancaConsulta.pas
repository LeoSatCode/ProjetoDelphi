unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, System.IniFiles, cFuncao, PngBitBtn;

type
  TfrmTelaHerancaConsulta = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    mskPesquisa: TMaskEdit;
    lblIndice: TLabel;
    grdPesquisa: TDBGrid;
    QryListagem: TFDQuery;
    dtsListagem: TDataSource;

    btnFechar: TPngBitBtn;
    ilimage: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure grdPesquisaDblClick(Sender: TObject);
    procedure mskPesquisaChange(Sender: TObject);
    procedure grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function RetornarCampoTraduzido(Campo: String): String;
    { Private declarations }
  public
    { Public declarations }
    aRetornarIdSelecionado:Variant;
    aIniciarPesquisaId:Variant;
    aCampoId:String;
    IndiceAtual:String;
  end;

var
  frmTelaHerancaConsulta: TfrmTelaHerancaConsulta;

implementation

uses
  uDTMConexao, uDTMVenda, uPrincipal;

{$R *.dfm}

procedure TfrmTelaHerancaConsulta.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
var ArquivoINI:TIniFile; // Variável para criar o arquivo INI para salvar preferências de Grid por usuário.
    I: Integer; // Ponteiro para passar por todas as colunas (pastas)
begin
  ExtractFilePath(Application.ExeName); // Garante que o INI fique na mesma pasta do .exe
  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'PreferenciasGridConsulta.ini'); //Criamos o INI File na pasta do .exe

  try
    for I := 0 to grdPesquisa.Columns.Count - 1 do  // O laço percorre do 0 à ultima coluna desenhada no Grid
    begin
      ArquivoINI.WriteInteger(
      oUsuarioLogado.nome, // Usamos o UsuarioLogado para separar de quem é a preferência.
      'Coluna_' + IntToStr(I), // Nomeamos a pasta com o Indice da coluna.
      grdPesquisa.Columns[I].Width); //A largura atual da coluna naquele exato segundo.
    end;
  finally
    ArquivoINI.Free;// Independentemente de dar erro ou não, sempre fechamos o caderninho para liberar a memória
  end;
  if QryListagem.Active then QryListagem.Close;
end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
Var I: Integer;
begin
  for I := 0 to grdPesquisa.Columns.Count - 1 do
    grdPesquisa.Columns[I].Title.Alignment := taCenter;

  if QryListagem.Active then QryListagem.Close;
  ExibirLabelIndice(IndiceAtual, lblIndice);
  QryListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
var ArquivoINI: TIniFile ; //Referenciamos novamente nosso Arquivo
    I:Integer; //Passamos o ponteiro
begin

  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'PreferenciasGridConsulta.ini');// Apontamos para o mesmo endereço que salvamos no FormClose

  try
    for I := 0 to grdPesquisa.Columns.Count - 1 do //Percorremos o grid recem desenhado
    begin
      grdPesquisa.Columns[I].Width := ArquivoINI.ReadInteger //Redefinimos a largura do grid baseado no que está desenhado
      (oUsuarioLogado.nome, // Pegamos o UsuarioLogado
      'Coluna_' + IntToStr(I),//Procuramos a anotação correspondente à coluna atual.
      grdPesquisa.Columns[I].Width); //Se for primeiro acesso, mantém o Width padrão do Delphi.
    end;
  finally
    ArquivoINI.Free; //Liberamos o INI da memória.
  end;

  if (aIniciarPesquisaId<>Unassigned) then
  begin
    QryListagem.Locate(aCampoId, aIniciarPesquisaId, [loPartialKey])
  end;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDblClick(Sender: TObject);
begin
  aRetornarIdSelecionado  := QryListagem.FieldByName(aCampoId).AsVariant;
  Close;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  id: Integer;
  imgIndex: Integer;
begin

  // pinta o fundo (ANTES de qualquer desenho)

  grdPesquisa.Canvas.Brush.Style := bsSolid; // o fundo será pintado com cor sólida

  if not (gdSelected in State) then //Verifica se a linha NÂO está selecionada
  begin
    if (QryListagem.RecNo mod 2 = 0) then // O numero é divisível por 2?
      grdPesquisa.Canvas.Brush.Color := clWhite // Se for, pinta de branco
    else
      grdPesquisa.Canvas.Brush.Color := $00F0F0F0; // Se não for, pinta de cinza claro
  end
  else if not (Column.FieldName = 'situacaoId') then //Não destaca a coluna da Situação ID
  begin
    grdPesquisa.Canvas.Brush.Color := $00FFCC99; //Cor da linha selecionada azul Yzidro (acho kkkkkk)
  end
  else if (Column.FieldName = 'situacaoId') then
  begin
    grdPesquisa.Canvas.Brush.Color := clWhite;
  end;

  grdPesquisa.Canvas.TextOut(
    Rect.Left + 2,
    Rect.Top + 2,
    Column.Field.AsString
  );

  grdPesquisa.Canvas.FillRect(Rect); // Pinta o fundo da célula com a cor escolhida


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
      grdPesquisa.Canvas,
      Rect.Left + (Rect.Width - ilimage.Width) div 2,
      Rect.Top + (Rect.Height - ilimage.Height) div 2,
      imgIndex
    );
  end
  else
  begin
    // Outras colunas continuam com comportamento padrão
    grdPesquisa.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmTelaHerancaConsulta.grdPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //Bloqueia o CTRL + DEL
  if (Shift = [ssCtrl]) and (Key = 46) then
     Key:=0;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaTitleClick(Column: TColumn);
begin
  IndiceAtual                 :=Column.FieldName; //A coluna que eu der um click, passa para o Indice Atual
  QryListagem.IndexFieldNames :=IndiceAtual; //O Indice Atual é jogado para a Query
  ExibirLabelIndice(IndiceAtual, lblIndice); // E aqui o campo é traduzido.
end;

procedure TfrmTelaHerancaConsulta.mskPesquisaChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

//Procedimentos de Controle de Tela
procedure TfrmTelaHerancaConsulta.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHerancaConsulta.RetornarCampoTraduzido(Campo:String):String;
var i:Integer; //Nosso "I" do tipo Int
begin
  for I := 0 to QryListagem.Fields.Count-1 do begin // Para cada "I" (indice) que for igual a 0 faça (percorra)...
    if LowerCase(QryListagem.Fields[i].FieldName)=LowerCase(Campo) then  begin  //Se o campo da QryListagem ter um FieldName = Campo
      Result:= QryListagem.Fields[i].DisplayLabel; // Retorne o campo da QryListagem no DisplayLabel
      Break; //Para a execução. *Bem parecido com o While do Python
    end;
  end;

end;

end.
