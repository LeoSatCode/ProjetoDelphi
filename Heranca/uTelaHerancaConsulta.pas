unit uTelaHerancaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Buttons, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, System.IniFiles, cFuncao, PngBitBtn, cGridUtils, Vcl.Imaging.pngimage;

type
  TfrmTelaHerancaConsulta = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    mskPesquisar: TMaskEdit;
    lblIndice: TLabel;
    grdPesquisa: TDBGrid;
    QryListagem: TFDQuery;
    dtsListagem: TDataSource;
    ilimage: TImageList;
    pnlFechar: TPanel;
    imgj4: TImage;
    pnlPesquisar: TPanel;
    imgj2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlFecharClick(Sender: TObject);
    procedure grdPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdPesquisaTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure pnlPesquisarClick(Sender: TObject);
    procedure OnMouseEnter(Sender: TObject);
    procedure OnMouseLeave(Sender: TObject);
    procedure OnTabEnter(Sender: TObject);
    procedure OnTabExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    SelectOriginal:String;
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
  uDTMConexao, uDTMVenda, uPrincipal, cUsuarioLogado;

{$R *.dfm}

procedure TfrmTelaHerancaConsulta.pnlFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHerancaConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TGrid.SalvarGrid(grdPesquisa, 'PreferenciasGridConsulta.ini', oUsuarioLogado.nome, Self.ClassName);
  if QryListagem.Active then QryListagem.Close;
end;

procedure TfrmTelaHerancaConsulta.FormCreate(Sender: TObject);
Var I: Integer;
begin
  SelectOriginal := QryListagem.SQL.Text;
  for I := 0 to grdPesquisa.Columns.Count - 1 do
    grdPesquisa.Columns[I].Title.Alignment := taCenter;

  if QryListagem.Active then QryListagem.Close;
  ExibirLabelIndice(IndiceAtual, lblIndice);
  QryListagem.Open;
end;

procedure TfrmTelaHerancaConsulta.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    pnlFecharClick(pnlFechar);
  end;
end;

procedure TfrmTelaHerancaConsulta.FormShow(Sender: TObject);
begin
  TGrid.CarregarGrid(grdPesquisa, 'PreferenciasGridConsulta.ini', oUsuarioLogado.nome, Self.ClassName);

  if (aIniciarPesquisaId<>Unassigned) then
  begin
    QryListagem.Locate(aCampoId, aIniciarPesquisaId, [loPartialKey])
  end;
end;

procedure TfrmTelaHerancaConsulta.grdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  TGrid.ZebrarGrid(grdPesquisa, State, Column, QryListagem, Rect, ilimage, DataCol);
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

procedure TfrmTelaHerancaConsulta.mskPesquisarChange(Sender: TObject);
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

procedure TfrmTelaHerancaConsulta.OnMouseEnter(Sender: TObject);
begin
  TPanel(Sender).Color := $00D6E8FF;
  TPanel(Sender).Width := 111;
  TPanel(Sender).Height:= 25;
end;

procedure TfrmTelaHerancaConsulta.OnMouseLeave(Sender: TObject);
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

procedure TfrmTelaHerancaConsulta.OnTabEnter(Sender: TObject);
begin
  TPanel(Sender).BevelOuter := bvRaised;
  TPanel(Sender).Color := $0078AEEB;
end;

procedure TfrmTelaHerancaConsulta.OnTabExit(Sender: TObject);
begin
  TPanel(Sender).BorderStyle := bsNone;
  OnMouseLeave(Sender);
end;

//Procedimentos de Controle de Tela
procedure TfrmTelaHerancaConsulta.pnlPesquisarClick(Sender: TObject);
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
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

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
