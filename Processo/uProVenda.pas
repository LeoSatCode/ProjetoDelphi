unit uProVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, cGridUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, uDTMConexao, uDTMVenda, RxToolEdit, RxCurrEdit, System.ImageList, Vcl.ImgList, cProVendas, uEnum, JvExComCtrls, JvHotKey,
   System.IniFiles, System.UITypes, cRelatorio, PngBitBtn;

type
  TfrmProVendas = class(TfrmTelaHeranca)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    edtValorTotalProduto: TCurrencyEdit;
    lblValor: TLabel;
    lkpProduto: TDBLookupComboBox;
    lblCliente1: TLabel;
    lblQuantidade: TLabel;
    edtValorUnitario: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblQuantidade2: TLabel;
    edtTotalProduto: TCurrencyEdit;
    lblQuantidade3: TLabel;
    btnAdicionar: TPngBitBtn;
    btnRemover: TPngBitBtn;
    dbgridItensVenda: TDBGrid;
    pnl5: TPanel;
    lblCliente: TLabel;
    lblData: TLabel;
    btnCadCliente: TSpeedButton;
    bntConCliente: TSpeedButton;
    edtVendaId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    edtDataVenda: TDateEdit;
    lblData1: TLabel;
    edtDataValidade: TDateEdit;
    btnConOrcVenc: TSpeedButton;
    lblIndice1: TLabel;
    QryListagempreVendaId: TFDAutoIncField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TStringField;
    QryListagemdataEmissao: TSQLTimeStampField;
    QryListagemtotalVenda: TFMTBCDField;
    QryListagemstatus: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure dbgridItensVendaDblClick(Sender: TObject);
    procedure lkpClienteCloseUp(Sender: TObject);
    procedure btnCadClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgridItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bntConClienteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConOrcVencClick(Sender: TObject);



  private
    { Private declarations }
    dtmVendas:TdtmVenda;
    oVenda:TVenda;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    function Excluir:Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure LimparComponenteItem;
    procedure LimparCds;
    procedure CarregarRegistroSelecionado;
    function TotalizarVenda: Double;
    procedure AbrirCadastroCliente(AClienteId: Integer);
  public
    { Public declarations }
  end;

var
  frmProVendas: TfrmProVendas;

implementation

{$R *.dfm}

uses uCadCliente, cFuncao, uPrincipal, uConCliente, uRelPreVenda, uConOrcVen;

{$REGION 'Overrides'}
function TfrmProVendas.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtVendaId.Text<>EmptyStr then
     oVenda.VendaId:=StrToInt(edtVendaId.Text)
  else
     oVenda.VendaId:=0;

  oVenda.ClienteId        :=lkpCliente.KeyValue;
  oVenda.DataVenda        :=edtDataVenda.Date;
  oVenda.DataValidade     :=edtDataValidade.Date;
  oVenda.TotalVenda       :=edtValorTotalProduto.Value;

    if (EstadoDoCadastro=ecInserir) then
    begin
       oVenda.InserirPreVenda(dtmVendas.cdsItensVenda);
       ShowMessage('Pré-Venda gerada');
    end
    else if (EstadoDoCadastro=ecAlterar) then
    begin
       oVenda.AtualizarPreVenda(dtmVendas.cdsItensVenda);
       ShowMessage('');
    end;

  Result:=True;
end;

function TfrmProVendas.Excluir: Boolean;
var vPreVendaId: Integer;
    vStatus    : String;
begin
  //Dados da linha selecionada na Grid
  vPreVendaId:= QryListagem.FieldByName('preVendaId').AsInteger;
  vStatus    := QryListagem.FieldByName('status').AsString;

  //Se o pedido foi faturado no caixa, então não é possível apagar
  if vStatus = 'PAGO' then
  begin
    MessageDlg('Não é possível excluir uma Pré-Venda faturada no Caixa.', mtWarning, [mbOK], 0);
    Abort;
  end;

  //Pede confirmação ao usuário
  if MessageDlg('Deseja realmente cancelar essa Pré-Venda (Nº '+ IntToStr(vPreVendaId) + ')?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
    if oVenda.ApagarPreVenda(vPreVendaId) then
    begin
      MessageDlg('Pré-Venda cancelada com sucesso.', mtInformation, [mbOK],0);
      Result:=True;
    end
    else
    begin
      MessageDlg('Erro ao cancelar a Pré-Venda.', mtError, [mbOK], 0);
    end;
  end;
end;
{$ENDREGION}

procedure TfrmProVendas.btnAdicionarClick(Sender: TObject);
var Estoque:Integer;
    QntdDigitada:Integer;
begin
  inherited;

  Estoque := dtmVendas.QryProdutos.FieldByName('quantidade').AsInteger;
  QntdDigitada:= StrToInt(edtQuantidade.Text);

  if(QntdDigitada > Estoque) then begin
     MessageDlg('Quantidade Digitada maior que o estoque atual.',mtInformation,[mbOK],0);
     Abort;
  end
  else begin
    dtmVendas.QryProdutos.Close;
    dtmVendas.QryProdutos.Open;
  end;

  if VarIsNull(lkpProduto.KeyValue) then begin
    MessageDlg('Produto é um campo obrigatório' ,mtInformation,[mbOK],0);
    lkpProduto.SetFocus;
    Abort;
  end;

  if edtValorUnitario.Value<=0 then begin
    MessageDlg('Valor unitário não pode ser Zero' ,mtInformation,[mbOK],0);
    edtValorUnitario.SetFocus;
    Abort;
  end;

  if edtQuantidade.Value<=0 then begin
    MessageDlg('Quantidade não pode ser Zero' ,mtInformation,[mbOK],0);
    edtQuantidade.SetFocus;
    Abort;
  end;

  if dtmVendas.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, []) then begin
    MessageDlg('Esse produto já foi selecionado' ,mtInformation,[mbOk],0);
    lkpProduto.SetFocus;
    Abort;
  end;

  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  dtmVendas.cdsItensVenda.Append;
  dtmVendas.cdsItensVenda.FieldByName('produtoId').AsInteger:=lkpProduto.KeyValue;
  dtmVendas.cdsItensVenda.FieldByName('nomeProduto').AsString:=dtmVendas.QryProdutos.FieldByName('nome').AsString;
  dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.Value;
  dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat := edtTotalProduto.Value;
  dtmVendas.cdsItensVenda.Post;
  edtValorTotalProduto.Value:=TotalizarVenda;
  Application.ProcessMessages;

  LimparComponenteItem;

  lkpProduto.SetFocus;

end;

procedure TfrmProVendas.LimparComponenteItem;
begin
  lkpProduto.KeyValue     :=null;
  edtQuantidade.Value     :=0;
  edtValorUnitario.Value  :=0;
  edtTotalProduto.Value   :=0;
end;

procedure TfrmProVendas.lkpClienteCloseUp(Sender: TObject);
var Observacao:string;
begin
  inherited;
  Observacao:=dtmVendas.QryCliente.FieldByName('observacao').AsString;

  if(dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger = 3) then
  begin
    if Observacao <> '' then
      ShowMessage('ATENÇÃO: ' + sLineBreak + Observacao)
    else
      ShowMessage('Cliente em situação de ATENÇÃO.' + sLineBreak+ 'Sem Observações');
  end;

  if(dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger = 2) then
  begin
    if Observacao <> '' then
    begin
      ShowMessage('Cliente BLOQUEADO. Razão: ' + sLineBreak + Observacao);
      lkpCliente.KeyValue:='';
    end
    else  begin
      ShowMessage('Cliente BLOQUEADO.' + sLineBreak+ 'Sem Observações');
      lkpCliente.KeyValue:='';
    end;
  end;

  if(dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger = 4) then
  begin
  if MessageDlg('Cliente está INATIVO.' + sLineBreak +
                'Deseja atualizar os dados cadastrais agora?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    AbrirCadastroCliente(
      dtmVendas.QryCliente.FieldByName('clienteId').AsInteger
    );
  end
  else
  begin
    lkpCliente.KeyValue:='';
  end;
  end;

  if (dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger = 5)then
  begin
    if MessageDlg('Cliente está efetuando primeira compra, deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      with dtmVendas.QryClienteUpdate do
      begin
        SQL.Text := 'UPDATE clientes SET situacaoId = :situacaoId WHERE clienteId = :id';
        ParamByName('situacaoId').AsInteger := 1;
        ParamByName('id').AsInteger := dtmVendas.QryCliente.FieldByName('clienteId').AsInteger;
        ExecSQL;
      end;

      ShowMessage('Cliente agora está ATIVO!');


      dtmVendas.QryCliente.Close;
      dtmVendas.QryCliente.Open;
    end
    else
      lkpCliente.KeyValue:='';
  end;
end;

procedure TfrmProVendas.AbrirCadastroCliente(AClienteId: Integer);
begin
  if not Assigned(frmCadCliente) then
    frmCadCliente := TfrmCadCliente.Create(nil);

  frmCadCliente.Show;
  frmCadCliente.BringToFront;

  // Carregar o cliente automaticamente
  frmCadCliente.QryListagem.Close;
  frmCadCliente.QryListagem.Open;
  frmCadCliente.QryListagem.Locate('clienteId', AClienteId, []);

  frmCadCliente.btnAlterar.Click;
end;

function TfrmProVendas.TotalizarProduto(valorUnitario, Quantidade:Double):Double;
begin
  Result :=valorUnitario * Quantidade;
end;

procedure TfrmProVendas.LimparCds;
begin
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof do
    dtmVendas.cdsItensVenda.Delete;

  edtValorTotalProduto.Value := 0;
end;

procedure TfrmProVendas.btnAlterarClick(Sender: TObject);
var vStatus:string;
begin
  //Não deixa alterar pedidos faturados no Caixa
  vStatus := QryListagem.FieldByName('status').AsString;
  if vStatus = 'PAGO' then
  begin
    MessageDlg('Essa Pré-Venda ja foi faturada no caixa e não pode ser alterada.', mtWarning, [mbOK], 0);
    Abort;
  end;

  //Seleciona a Pré-Venda
  if oVenda.SelecionarPreVenda(QryListagem.FieldByName('preVendaId').AsInteger, dtmVendas.cdsItensVenda) then begin
    edtVendaId.Text               :=IntToStr(oVenda.VendaId);
    lkpCliente.KeyValue           :=oVenda.ClienteId;
    edtDataVenda.Date             :=oVenda.DataVenda;
    edtDataValidade.Date          :=oVenda.DataValidade;
    edtValorTotalProduto.Value    :=oVenda.TotalVenda;
  end
  else begin
    btnCancelar.Click;
    MessageDlg('Erro ao carregar Pré-Venda', mtError, [mbOK],0);
    Abort;
  end;

  inherited;
end;

procedure TfrmProVendas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCds;
end;

procedure TfrmProVendas.btnConOrcVencClick(Sender: TObject);
begin
  inherited;
   Try
   frmConOrcVen:=TfrmConOrcVen.Create(Self);

   frmConOrcVen.ShowModal;

  Finally
   frmConOrcVen.Release;
  end;
end;

procedure TfrmProVendas.btnGravarClick(Sender: TObject);
begin

  if dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger = 2 then
  begin
    MessageDlg('Operação barrada: Cliente com status BLOQUEADO!', mtWarning, [mbOK], 0);
    Abort;
  end;

  // Validação se o carrinho não está vazio
  if dtmVendas.cdsItensVenda.IsEmpty then
  begin
    MessageDlg('Insira ao menos um produto para gerar a pré-venda!', mtWarning, [mbOK], 0);
    Abort;
  end;

  oVenda.clienteId   := dtmVendas.QryCliente.FieldByName('clienteId').AsInteger;
  oVenda.totalVenda  := edtValorTotalProduto.Value;
  oVenda.DataValidade:= edtDataValidade.Date;

   if edtVendaId.Text <> '' then
    oVenda.VendaId := StrToInt(edtVendaId.Text)
  else
    oVenda.VendaId := 0;

  oVenda.ClienteId  := dtmVendas.QryCliente.FieldByName('clienteId').AsInteger;
  oVenda.TotalVenda := edtValorTotalProduto.Value;

  if oVenda.VendaId = 0 then
  begin
    // NOVA PRÉ-VENDA
    if oVenda.InserirPreVenda(dtmVendas.cdsItensVenda) then
    begin
      MessageDlg('Pré-Venda gravada com sucesso!', mtInformation, [mbOK], 0);
      btnCancelar.Click;
      TRel.MostrarRelatorio(Self, TfrmRelPreVenda, oVenda.VendaId);
    end
    else
      MessageDlg('Erro ao gravar Pré-Venda.', mtError, [mbOK], 0);
  end
  else
  begin
    // ALTERAÇÃO
    if oVenda.AtualizarPreVenda(dtmVendas.cdsItensVenda) then
    begin
      MessageDlg('Pré-Venda atualizada com sucesso!', mtInformation, [mbOK], 0);
      btnCancelar.Click;
    end
    else
      MessageDlg('Erro ao atualizar Pré-Venda.', mtError, [mbOK], 0);
  end;

  QryListagem.Close;
  QryListagem.Open;
end;

procedure TfrmProVendas.btnCadClienteClick(Sender: TObject);
var
  frm: TfrmCadCliente;
  vSituacaoId: Integer;
  vClienteId: Integer;
  vNomeSituacao: string; // <-- A nossa variável tradutora
begin
  inherited;

  frm := TfrmCadCliente.Create(nil);
  try
    if frm.ShowModal = mrOk then
    begin
      dtmVendas.QryCliente.Close;
      dtmVendas.QryCliente.Open;
      dtmVendas.QryCliente.Last;

      vClienteId  := dtmVendas.QryCliente.FieldByName('clienteId').AsInteger;
      vSituacaoId := dtmVendas.QryCliente.FieldByName('situacaoId').AsInteger;

      // "Tradutor" de IDs para a interface
      case vSituacaoId of
        2: vNomeSituacao := 'BLOQUEADO';
        3: vNomeSituacao := 'ATENÇÃO';
        4: vNomeSituacao := 'INATIVO';
      else
        vNomeSituacao := 'RESTRITO';
      end;

      // Verifica o status do cliente novo
      if vSituacaoId in [2, 3, 4] then
      begin
        // Passando uma String amigável!
        MessageDlg('O cliente recém-cadastrado possui um status de restrição (' + vNomeSituacao + '). Ele não será vinculado à Pré-Venda automaticamente.', mtWarning, [mbOK], 0);
        lkpCliente.KeyValue := Null;
      end
      else if vSituacaoId = 5 then // 5=Prospecto
      begin
        MessageDlg('Cliente cadastrado como Prospecto. O sistema irá ativá-lo automaticamente para efetuar esta Pré-Venda!', mtInformation, [mbOK], 0);

        with dtmVendas.QryClienteUpdate do
        begin
          SQL.Text := 'UPDATE clientes SET situacaoId = 1 WHERE clienteId = :id';
          ParamByName('id').AsInteger := vClienteId;
          ExecSQL;
        end;

        dtmVendas.QryCliente.Close;
        dtmVendas.QryCliente.Open;
        dtmVendas.QryCliente.Locate('clienteId', vClienteId, []);
        lkpCliente.KeyValue := vClienteId;
      end
      else // É Ativo (1)
      begin
        lkpCliente.KeyValue := vClienteId;
      end;
    end;
  finally
    frm.Free;
    lkpCliente.SetFocus;
  end;
end;

procedure TfrmProVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TGrid.SalvarGrid(dbgridItensVenda,'PreferenciasPreVendaGrid', oUsuarioLogado.nome, Self.ClassName);
  QryListagem.Close;

end;

procedure TfrmProVendas.FormCreate(Sender: TObject);
Var I: Integer;
begin
  inherited;
  for I := 0 to dbgridItensVenda.Columns.Count - 1 do
    dbGridItensVenda.Columns[I].Title.Alignment := taCenter;

  dtmVendas:=TdtmVenda.Create(Self);

  oVenda:=TVenda.Create(dtmConexao.ConexaoDB);
  IndiceAtual:='clienteId';
end;

procedure TfrmProVendas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    Key := 0;
    Abort; // corta qualquer fluxo
  end;
  inherited;

end;

procedure TfrmProVendas.FormShow(Sender: TObject);
begin
  oVenda.AtualizarStatusVencidos;

  QryListagem.Open;
  TGrid.CarregarGrid(dbgridItensVenda,'PreferenciasPreVendaGrid', oUsuarioLogado.nome, Self.ClassName);
  btnNovo.SetFocus;
end;

procedure TfrmProVendas.btnNovoClick(Sender: TObject);
begin
  inherited;
  dtmVendas.QryProdutos.Close;
  dtmVendas.QryProdutos.Open;
  edtDataVenda.Date:=Date;
  edtDataValidade.Date := Date + 5;
  lkpCliente.SetFocus;

  LimparCds;
end;

procedure TfrmProVendas.bntConClienteClick(Sender: TObject);
begin
  inherited;
  Try
   frmConCliente:=TfrmConCliente.Create(Self);

   if lkpCliente.KeyValue<>Null then
     frmConCliente.aIniciarPesquisaId:=lkpCliente.KeyValue;

   frmConCliente.ShowModal;

   if frmConCliente.aRetornarIdSelecionado <> Unassigned then
  begin
  lkpCliente.KeyValue := frmConCliente.aRetornarIdSelecionado;

  lkpClienteCloseUp(lkpCliente);
  end;
  Finally
   frmConCliente.Release;
  end;

end;

procedure TfrmProVendas.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if VarIsNull(lkpProduto.KeyValue) then begin
    MessageDlg('Selecione o Produto a ser excluido' ,mtInformation,[mbOK],0);
    dbgridItensVenda.SetFocus;
    Abort;
  end;

  if dtmVendas.cdsItensVenda.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     dtmVendas.cdsItensVenda.Delete;
     edtValorTotalProduto.Value := TotalizarVenda;
     LimparComponenteItem;
  end;

end;

procedure TfrmProVendas.dbgridItensVendaDblClick(Sender: TObject);
begin
  inherited;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVendas.dbgridItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Linha: Integer;
begin
  if (gdFixed in State) then
  begin
    dbgridItensVenda.Canvas.Brush.Color := clGray;
    dbgridItensVenda.Canvas.FillRect(Rect);
    dbgridItensVenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    Exit;
  end;

  Linha := dbgridItensVenda.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    dbgridItensVenda.Canvas.Font.Color := clBlack;

    if (Linha mod 2) = 0 then
      dbgridItensVenda.Canvas.Brush.Color := clWebLightgrey
    else
      dbgridItensVenda.Canvas.Brush.Color := clWhite;
  end
  else
  begin
    dbgridItensVenda.Canvas.Brush.Color := $00FFCC99;
    dbgridItensVenda.Canvas.Font.Color := clHighlightText;
  end;

  dbgridItensVenda.Canvas.FillRect(Rect);


  dbgridItensVenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProVendas.edtQuantidadeEnter(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVendas.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.value);
end;

procedure TfrmProVendas.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if not VarIsNull(TDBLookupComboBox(Sender).KeyValue) then begin
    edtValorUnitario.Value:=dtmVendas.QryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value:=1;
    edtValorTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

procedure TfrmProVendas.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue       := dtmVendas.cdsItensVenda.FieldByName('produtoId').AsInteger;
  edtQuantidade.Value       := dtmVendas.cdsItensVenda.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value    := dtmVendas.cdsItensVenda.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value     := dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
end;

function TfrmProVendas.TotalizarVenda:Double;
begin
  Result:=0;
  dtmVendas.cdsItensVenda.First;
  while not dtmVendas.cdsItensVenda.Eof  do begin
    result := Result + dtmVendas.cdsItensVenda.FieldByName('valorTotalProduto').AsFloat;
    dtmVendas.cdsItensVenda.Next;
  end;

end;
end.
