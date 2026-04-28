unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,cValidacoes, System.Character,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.Buttons, RxToolEdit, cCadCliente, uEnum, System.IniFiles, System.ImageList, Vcl.ImgList, System.JSON,
  IPPeerClient, REST.Client,Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Imaging.pngimage, cFuncao, PngBitBtn;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtCEP: TMaskEdit;
    lbl1: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtTelefone: TMaskEdit;
    lbl2: TLabel;
    edtEmail: TLabeledEdit;
    edtDataNascimento: TDateEdit;
    lblData: TLabel;
    fdtncfldQryListagemclienteId: TFDAutoIncField;
    strngfldQryListagemnome: TStringField;
    strngfldQryListagemendereco: TStringField;
    strngfldQryListagemcidade: TStringField;
    strngfldQryListagembairro: TStringField;
    strngfldQryListagemestado: TStringField;
    strngfldQryListagemcep: TStringField;
    strngfldQryListagemtelefone: TStringField;
    strngfldQryListagememail: TStringField;
    sqltmstmpfldQryListagemdatanascimento: TSQLTimeStampField;
    edtNome: TLabeledEdit;
    edtClienteId: TLabeledEdit;
    edtEstado: TLabeledEdit;
    cbPessoa: TComboBox;
    lbl3: TLabel;
    edtDocumento: TEdit;
    lblDocumento: TLabel;
    QryListagemdocumento: TStringField;
    lkpSituacao: TDBLookupComboBox;
    QrySituacao: TFDQuery;
    intgrfldQryListagemsituacaoId: TIntegerField;
    dtsSituacao: TDataSource;
    QrySituacaosituacaoId: TFDAutoIncField;
    QrySituacaosituacaoCliente: TStringField;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    lblSituacao: TLabel;
    edtObservacao: TLabeledEdit;
    QryListagemobservacao: TStringField;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDocumentoChange(Sender: TObject);
    procedure cbPessoaChange(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure edtDocumentoExit(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure lkpSituacaoCloseUp(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
  private
    { Private declarations }
    oCliente:TCliente;
    function Excluir:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; override;
    procedure DefinirTipoPessoaPeloDocumento(const ADoc: string);
  public
    { Public declarations }
    ClienteIdGerado: Integer;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses
  uDTMConexao, uDTMVenda;

{$R *.dfm}

{ TfrmCadCliente }
{$REGION 'Override'}

function TfrmCadCliente.Excluir: Boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     Result:=oCliente.Apagar;
  end;
end;

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  inherited;
  oCliente := TCliente.Create(dtmConexao.ConexaoDB);

  if VarIsNull(lkpSituacao.KeyValue) then
  begin
    ShowMessage('Selecione uma situação!');
    Exit(False);
  end;

  oCliente.situacaoId := lkpSituacao.KeyValue;

  if edtClienteId.Text<>EmptyStr then
    oCliente.codigo:=StrToInt(edtClienteId.Text)
  else
    oCliente.codigo:=0;

  with oCliente do begin
    nome            :=edtNome.Text;
    documento       :=edtDocumento.Text;
    cep             :=edtCEP.Text;
    endereco        :=edtEndereco.Text;
    bairro          :=edtBairro.Text;
    cidade          :=edtCidade.Text;
    telefone        :=edtTelefone.Text;
    email           :=edtEmail.Text;
    dataNascimento  :=edtDataNascimento.Date;
    situacaoId      :=lkpSituacao.KeyValue;
    estado          :=edtEstado.Text;
    observacao      :=edtObservacao.Text;
  end;

  try
    if (EstadoDoCadastro=ecInserir) then
    begin
      Result := oCliente.Inserir;

      if Result then begin
        ClienteIdGerado := oCliente.codigo;
        ShowMessage('Inserido');

        ModalResult := mrOk;
      end;
    end
    else if (EstadoDoCadastro=ecAlterar) then
    begin
      Result := oCliente.Atualizar;
      ShowMessage('Alterado');
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;

end;
procedure TfrmCadCliente.lkpSituacaoCloseUp(Sender: TObject);
begin
  inherited;
  if (lkpSituacao.Text = 'BLOQUEADO') or (lkpSituacao.Text = 'ATENÇÃO') then
  begin
    edtObservacao.Visible:=True;
  end
  else
  begin
    edtObservacao.Visible:=false;
  end;

end;

{$ENDREGION}

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin

  if ((QryListagem.FieldByName('situacaoId').AsInteger = 2) or (QryListagem.FieldByName('situacaoId').AsInteger = 3) ) then
      edtObservacao.Visible:=True
  else
      edtObservacao.Visible:=False;

  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then begin
     edtClienteId.Text:=IntToStr(oCliente.codigo);
     with oCliente do begin
      edtNome.Text           := nome;
      edtDocumento.Text      := documento;
      edtCEP.Text            := cep;
      edtEndereco.Text       := endereco;
      edtBairro.Text         := bairro;
      edtCidade.Text         := cidade;
      edtTelefone.Text       := telefone;
      edtEmail.Text          := email;
      edtDataNascimento.Date := dataNascimento;
      lkpSituacao.KeyValue   := situacaoId;
      edtEstado.Text         := estado;
      edtObservacao.Text     := observacao;
      DefinirTipoPessoaPeloDocumento(documento);
    end;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadCliente.btnFecharClick(Sender: TObject);
begin
  inherited;
  TFuncao.AtualizarDashBoard;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDataNascimento.Date:=Date;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.cbPessoaChange(Sender: TObject);
begin
  if cbPessoa.Text = 'Física' then
  begin
    lblDocumento.Caption := 'CPF';
    edtDocumento.MaxLength := 14;
  end
  else
  begin
    lblDocumento.Caption:='CNPJ';
    edtDocumento.MaxLength := 18;
  end;

  edtDocumento.Clear;
end;

procedure TfrmCadCliente.edtDocumentoExit(Sender: TObject);
begin
  if cbPessoa.Text = 'Física' then
 begin
  if not ValidarCPF(edtDocumento.Text) then
  begin
    ShowMessage('CPF Inválido');
    edtDocumento.SetFocus;
    Exit;
  end;
 end;

 if cbPessoa.Text = 'Jurídica' then
 begin
  if not ValidarCNPJ(edtDocumento.Text) then
  begin
    ShowMessage('CNPJ Inválido');
    edtDocumento.SetFocus;
    Exit;
  end;
 end;
end;


procedure TfrmCadCliente.edtCEPExit(Sender: TObject);
var
  CEPDigitado: string;
  ObjetoJSON: TJSONObject;
  Erro: Boolean;
  Valor: string;
begin
  CEPDigitado := StringReplace(edtCEP.Text, '-', '', [rfReplaceAll]);

  if Length(CEPDigitado) <> 8 then Exit;

  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + CEPDigitado + '/json/';

  try
    RESTRequest1.Execute;

    if Assigned(RESTResponse1.JSONValue) then
    begin
      ObjetoJSON := RESTResponse1.JSONValue as TJSONObject;

      if ObjetoJSON.TryGetValue<Boolean>('erro', Erro) and Erro then
        Exit;

      if ObjetoJSON.TryGetValue('logradouro', Valor) then
        edtEndereco.Text := Valor;

      if ObjetoJSON.TryGetValue('bairro', Valor) then
        edtBairro.Text := Valor;

      if ObjetoJSON.TryGetValue('localidade', Valor) then
        edtCidade.Text := Valor;

      if ObjetoJSON.TryGetValue('uf', Valor) then
        edtEstado.Text := Valor;
    end;
  except

  end;
end;

procedure TfrmCadCliente.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

procedure TfrmCadCliente.edtDocumentoChange(Sender: TObject);
var
  TextoLimpo: String; // Variável que vai guardar apenas os números puros, sem sujeira
  Edit: TEdit;        // Variável de apoio para manipularmos o campo que disparou o evento
begin

  Edit := TEdit(Sender); // Pega o "Sender" genérico e avisa o Delphi: "Isso aqui é um TEdit, tá?"

  // Chama a nossa função para limpar o texto atual e pegar só os números
  // Ex: se o cara digitou "123.", ele limpa o ponto e guarda só o "123"
  TextoLimpo := TFuncao.SomenteNumeros(Edit.Text);

  // Verifica se o usuário escolheu "Física" lá no ComboBox
  if cbPessoa.Text = 'Física' then
  begin

    if Length(TextoLimpo) > 11 then
      TextoLimpo := Copy(TextoLimpo, 1, 11);
    // SUPER IMPORTANTE: Desliga a "escuta" desse evento temporariamente!
    // Se não fizermos isso, quando alterarmos o texto abaixo, ele vai chamar o evento de novo, gerando um Loop Infinito (trava tudo)
    Edit.OnChange := nil;

    try // Tenta executar os comandos abaixo.

      // Se o cara já passou do 9º número (chegou no dígito verificador final)
      if Length(TextoLimpo) > 9 then
        // Aplica a máscara completa: corta 3, põe ponto, corta 3, põe ponto, corta 3, põe traço, corta os 2 finais
        Edit.Text := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3) + '.' + Copy(TextoLimpo, 7, 3) + '-' + Copy(TextoLimpo, 10, 2)

      // Se não passou de 9, mas já passou do 6º número (precisa do segundo ponto)
      else if Length(TextoLimpo) > 6 then
        // Corta 3, põe ponto, corta 3, põe ponto, e cola o resto (que pode ter até 3 números)
        Edit.Text := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3) + '.' + Copy(TextoLimpo, 7, 3)

      // Se não passou de 6, mas já passou do 3º número (precisa só do primeiro ponto)
      else if Length(TextoLimpo) > 3 then
        // Corta 3, põe ponto, e cola o resto
        Edit.Text := Copy(TextoLimpo, 1, 3) + '.' + Copy(TextoLimpo, 4, 3);

      // Joga a barrinha piscando (cursor) lá pro final do texto, para o usuário continuar digitando sem bugar de trás pra frente
      Edit.SelStart := Length(Edit.Text);

    finally
      // O finally garante que, dando certo ou dando erro lá no "try", essa linha abaixo VAI rodar:
      // Religa o evento OnChange para que ele volte a escutar a próxima tecla que o usuário digitar!
      Edit.OnChange := edtDocumentoChange;
    end;
  end;

  if cbPessoa.Text = 'Jurídica' then
begin
  if Length(TextoLimpo) > 14 then
  TextoLimpo := Copy(TextoLimpo, 1, 14);

  Edit.OnChange := nil;
  try
    // Mais de 12 números (chegou no traço final: XX.XXX.XXX/XXXX-XX)
    if Length(TextoLimpo) > 12 then
      Edit.Text := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3) + '/' + Copy(TextoLimpo, 9, 4) + '-' + Copy(TextoLimpo, 13, 2)

    // Mais de 8 números (chegou na barra: XX.XXX.XXX/XXXX)
    else if Length(TextoLimpo) > 8 then
      Edit.Text := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3) + '/' + Copy(TextoLimpo, 9, 4)

    // Mais de 5 números (chegou no segundo ponto: XX.XXX.XXX)
    else if Length(TextoLimpo) > 5 then
      Edit.Text := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3) + '.' + Copy(TextoLimpo, 6, 3)

    // Mais de 2 números (chegou no primeiro ponto: XX.XXX)
    else if Length(TextoLimpo) > 2 then
      Edit.Text := Copy(TextoLimpo, 1, 2) + '.' + Copy(TextoLimpo, 3, 3);

    Edit.SelStart := Length(Edit.Text);

  finally
    Edit.OnChange := edtDocumentoChange;
  end;
end;

end;

procedure TfrmCadCliente.edtDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

procedure TfrmCadCliente.edtEmailExit(Sender: TObject);
begin
  inherited;
  if (edtEmail.Text <> '') and ((Pos('@', edtEmail.Text) = 0) or (Pos('.', edtEmail.Text) = 0)) then
    begin
      MessageDlg('E-mail inválido!', mtError, [mbOK], 0);
      edtEmail.SetFocus;
      Abort;
    end;
end;

procedure TfrmCadCliente.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (IsLetter(Key) or (Key = #8) or (Key = #32) or (Key = #3) or (Key = #22)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadCliente.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (IsLetter(Key) or (Key = #8) or (Key = #32) or (Key = #3) or (Key = #22)) then
  begin
    Key := #0;
  end;
end;

procedure TfrmCadCliente.edtTelefoneChange(Sender: TObject);
var TextoLimpo: string;
    Edit: TEdit;
begin
  inherited;
  TextoLimpo:=edtTelefone.Text;

  TextoLimpo:=TFuncao.SomenteNumeros(edtTelefone.Text);

  Edit := TEdit(Sender);

  if TextoLimpo = '' then Exit;

  if (TextoLimpo[1]='0') and (TextoLimpo[3]='0') and (TextoLimpo[4]='0') then begin
    if Length(TextoLimpo) > 11 then
        TextoLimpo := Copy(TextoLimpo, 1, 11);
      Edit.OnChange := nil;
      try
        if  Length(TextoLimpo) > 7 then
          Edit.Text := Copy(TextoLimpo, 1, 4) + ' ' + Copy(TextoLimpo, 5, 3) + ' ' + Copy(TextoLimpo, 8, 4)
        else if Length(TextoLimpo) > 4 then
          Edit.Text := Copy(TextoLimpo, 1, 4) + ' ' + Copy(TextoLimpo, 5, 3)
        else if Length(TextoLimpo) <= 4 then
          Edit.Text := Copy(TextoLimpo, 1, 4);

      Edit.SelStart := Length(Edit.Text);
      finally
        Edit.OnChange := edtTelefoneChange;
      end;
    end;

    if TextoLimpo[1]<>'0' then begin
      if Length(TextoLimpo) <= 10 then
      begin
         TextoLimpo := Copy(TextoLimpo, 1,10);
      Edit.OnChange := nil;
        try
          if Length(TextoLimpo) > 6 then
            Edit.Text :='('+Copy(TextoLimpo, 1, 2)+ ')' + Copy(TextoLimpo, 3, 4) + '-' + Copy(TextoLimpo, 7, 4)
          else if Length(TextoLimpo) > 3 then
            Edit.Text :='('+Copy(TextoLimpo, 1, 2)+ ')' + Copy(TextoLimpo, 3, 4)
          else if Length(TextoLimpo) >= 3 then
            Edit.Text := '(' + Copy(TextoLimpo,1,2) + ')' + Copy(TextoLimpo,3,Length(TextoLimpo)-2)// o -2 serve para remover os dois primeiros números do total, porque eles já foram usados no DDD
          else
            Edit.Text := '(' + TextoLimpo;  // Mostra o '(' e os dois primeiros números


        Edit.SelStart := Length(Edit.Text);
        finally
          Edit.OnChange := edtTelefoneChange;
        end;
      end
      else
      begin
        TextoLimpo := Copy(TextoLimpo, 1,11);
      Edit.OnChange := nil;
        try
          if Length(TextoLimpo) > 6 then
          Edit.Text :='('+Copy(TextoLimpo, 1, 2)+ ')' + Copy(TextoLimpo, 3, 5) + '-' + Copy(TextoLimpo, 8, 4)
          else if Length(TextoLimpo) > 3 then
          Edit.Text :='('+Copy(TextoLimpo, 1, 2)+ ')' + Copy(TextoLimpo, 3, 5)
          else if Length(TextoLimpo) < 3 then
          Edit.Text :='('+Copy(TextoLimpo, 1, 2)+ ')';


        Edit.SelStart := Length(Edit.Text);
        finally
          Edit.OnChange := edtTelefoneChange;
        end;
      end;
    end;
end;

procedure TfrmCadCliente.edtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8]) then Key:=#0;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  QrySituacao.Open;
  oCliente:=TCliente.Create(dtmConexao.ConexaoDB);

  IndiceAtual:='nome';


end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  inherited;
  if Assigned(oCliente) then FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.DefinirTipoPessoaPeloDocumento(const ADoc: string);
var
  DocLimpo: string;
begin
  DocLimpo := TFuncao.SomenteNumeros(ADoc);

  if Length(DocLimpo) > 11 then
    cbPessoa.ItemIndex := cbPessoa.Items.IndexOf('Jurídica')
  else if Length(DocLimpo) > 0 then
    cbPessoa.ItemIndex := cbPessoa.Items.IndexOf('Física');
end;

end.
