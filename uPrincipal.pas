unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter,
  ufrmAtualizaDB, uCadUsuario, uLogin, cUsuarioLogado, Vcl.ComCtrls,FireDAC.Stan.Option,cAtualizacaoTabelaMSSQL,
  cAtualizacaoBandoDeDados, cAcaoAcesso,RLReport, uUsuarioVsAcoes, Vcl.ExtCtrls, VclTee.TeeGDIPlus, Data.DB,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.StdCtrls, cFuncao, uCaixa;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    CADASTRO1: TMenuItem;
    MOVIMENTAO1: TMenuItem;
    RELATRIO1: TMenuItem;
    CLIENTE1: TMenuItem;
    N1: TMenuItem;
    CATEGORIA1: TMenuItem;
    PRODUTO1: TMenuItem;
    N2: TMenuItem;
    mnuFechar: TMenuItem;
    VENDAS1: TMenuItem;
    CLIENTE2: TMenuItem;
    N3: TMenuItem;
    PRODUTO2: TMenuItem;
    N4: TMenuItem;
    VENDAPORDATA1: TMenuItem;
    mniCategoria2: TMenuItem;
    mniFichaCliente1: TMenuItem;
    mniPRODUTOSPORCATEGORIA1: TMenuItem;
    mniUSURIO1: TMenuItem;
    mniN5: TMenuItem;
    mniALTERARSENHA1: TMenuItem;
    stbPrincipal: TStatusBar;
    AOACESSO1: TMenuItem;
    mniN6: TMenuItem;
    mniUSURIOSVSAES1: TMenuItem;
    grdpnl1: TGridPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    dbcht1: TDBChart;
    ProdutoEstoque: TBarSeries;
    dbcht3: TDBChart;
    psrsSeries2: TPieSeries;
    dbcht31: TDBChart;
    fstlnsrsSeries21: TFastLineSeries;
    DBChart1: TDBChart;
    PieSeries1: TPieSeries;
    pnl5: TPanel;
    lbl1: TLabel;
    tmrAtualizacaoDashBoard: TTimer;
    mniROCARUSURIO1: TMenuItem;
    mniCAIXA1: TMenuItem;
    procedure mnuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CATEGORIA1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLIENTE1Click(Sender: TObject);
    procedure PRODUTO1Click(Sender: TObject);
    procedure VENDAS1Click(Sender: TObject);
    procedure mniCategoria2Click(Sender: TObject);
    procedure CLIENTE2Click(Sender: TObject);
    procedure mniFichaCliente1Click(Sender: TObject);
    procedure PRODUTO2Click(Sender: TObject);
    procedure mniPRODUTOSPORCATEGORIA1Click(Sender: TObject);
    procedure VENDAPORDATA1Click(Sender: TObject);
    procedure mniUSURIO1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniALTERARSENHA1Click(Sender: TObject);
    procedure AOACESSO1Click(Sender: TObject);
    procedure mniUSURIOSVSAES1Click(Sender: TObject);
    procedure tmrAtualizacaoDashBoardTimer(Sender: TObject);
    procedure CADASTRO1Click(Sender: TObject);
    procedure MOVIMENTAO1Click(Sender: TObject);
    procedure RELATRIO1Click(Sender: TObject);
    procedure mniROCARUSURIO1Click(Sender: TObject);
    procedure mniCAIXA1Click(Sender: TObject);

  private
    { Private declarations }
    TeclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
    procedure AtualizarDashBoard;
    procedure TrocarUsuario;


  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  oUsuarioLogado:TUsuarioLogado;

implementation

{$R *.dfm}

uses uCadCategoria, uCadCliente, uCadProduto, uProVenda,
     uRelCategoria, uRelCadCliente,
     uRelCadClienteFicha, uRelProduto,
     uRelProdutoComCategoria, uSelecionarData,
     uRelVendaPorData, uRelProVenda,uAlterarSenha, cArquivoIni, uCadAcaoAcesso, uTelaHeranca, uDTMGrafico;

procedure TfrmPrincipal.CADASTRO1Click(Sender: TObject);
begin
  tmrAtualizacaoDashBoard.Enabled:=False;
end;

procedure TfrmPrincipal.CATEGORIA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadCategoria, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.CLIENTE1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadCliente, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(TeclaEnter);
  FreeAndNil(dtmConexao);
  FreeAndNil(dtmGrafico);

  if Assigned(oUsuarioLogado) then FreeAndNil(oUsuarioLogado); //Destroi o objeto da memoria se o mesmo existir
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not FileExists(TArquivo.ArquivoIni) then
  begin
    TArquivo.AtualizarIni('SERVER', 'TipoDataBase', 'MSSQL');
    //TArquivo.AtualizarIni('SERVER', 'HostName', '.\');
    //TArquivo.AtualizarIni('SERVER', 'Port', '1433');
    TArquivo.AtualizarIni('SERVER', 'User', 'sa');
    TArquivo.AtualizarIni('SERVER', 'Password', 'domtec@10');
    TArquivo.AtualizarIni('SERVER', 'Database', 'vendas');

    MessageDlg('Arquivo '+ TArquivo.ArquivoIni +' Criado com sucesso.'+#13+
               'Configure o arquivo antes de inicializar a aplicação',mtInformation,[mbOK],0);

    Application.Terminate;
  end
  else begin
    {
    dtmConexao := TdtmConexao.Create(Self);
    dtmConexao.ConexaoDB.Params.DriverID:='MSSQL';
    dtmConexao.ConexaoDB.Params.UserName:='sa';
    dtmConexao.ConexaoDB.Params.Password:='domtec@10';
    dtmConexao.ConexaoDB.Params.Database:='Vendas';
    dtmConexao.ConexaoDB.Connected:=true;
    }
    frmAtualizaDB:=TfrmAtualizaDB.Create(Self); //Cria o formulário
    frmAtualizaDB.Show; //O 'Show', coloca o formulário na tela e continua executando as linhas abaixo
    frmAtualizaDB.Refresh; //Atualiza a tela
    dtmConexao := TdtmConexao.Create(Self);

    with dtmConexao.ConexaoDB.Params do begin
     dtmConexao.ConexaoDB.Connected:=False;
     if TArquivo.LerIni('SERVER', 'TipoDataBase')='MSSQL' then
        DriverID:='MSSQL'; //Protocolo do Banco de Dados


     UserName:=TArquivo.LerIni('SERVER', 'User');//Usuario do Banco de Dados
     Password:=TArquivo.LerIni('SERVER', 'Password');
     Database:=TArquivo.LerIni('SERVER', 'DataBase');
    end;
    dtmConexao.ConexaoDB.TxOptions.AutoCommit:=True;
    dtmConexao.ConexaoDB.TxOptions.Isolation :=xiReadCommitted;
    dtmConexao.ConexaoDB.Connected           := True;

    AtualizacaoBancoDados(frmAtualizaDB);

    TAcaoAcesso.CriarAcoes(TfrmCadCategoria, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadCliente, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadProduto, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadUsuario, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCadAcaoAcesso, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmAlterarSenha, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmProVendas, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmCaixa, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelVendaPorData, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelClienteFicha, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCliente, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelProdutoComCategoria, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelProduto, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmRelCategoria, dtmConexao.ConexaoDB);
    TAcaoAcesso.CriarAcoes(TfrmUsuarioVsAcoes,dtmConexao.ConexaoDB);

    TAcaoAcesso.PreencherUsuariosVsAcoes(dtmConexao.ConexaoDB);

    dtmGrafico:=TdtmGrafico.Create(Self);
    frmAtualizaDB.Free; //Sai da memória
    dtmConexao.ConexaoDB.Connected:=true;// Conecta ao Banco de Dados

    AtualizarDashBoard;

    TeclaEnter:= TMREnter.Create(Self);
    with TeclaEnter do begin
    FocusEnabled:=True;
    FocusColor:=clInfoBk;
    end;
  end
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 //Primeiro criamos o objeto
  try
    oUsuarioLogado := TUsuarioLogado.Create;
    frmLogin:=TfrmLogin.Create(Self);
    frmLogin.ShowModal;
  finally
    FreeAndNil(frmLogin);

  end;
  stbPrincipal.Panels[0].Text:='USUÁRIO: '+oUsuarioLogado.nome;

end;

procedure TfrmPrincipal.mniALTERARSENHA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmAlterarSenha, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mniCAIXA1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCaixa, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mniCategoria2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCategoria, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.PRODUTO2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelProduto, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.RELATRIO1Click(Sender: TObject);
begin
  tmrAtualizacaoDashBoard.Enabled:=False;
end;

procedure TfrmPrincipal.mniROCARUSURIO1Click(Sender: TObject);
begin
  TrocarUsuario;
end;

procedure TfrmPrincipal.TrocarUsuario;
var
  UsuarioBackup: TUsuarioLogado;  // variável pra guardar o usuário atual antes de tentar trocar
begin
  UsuarioBackup := TUsuarioLogado.Create; // cria um objeto auxiliar (backup)

  try
    // salva usuário atual e copia código, nome e senha dele
    UsuarioBackup.codigo := oUsuarioLogado.codigo;
    UsuarioBackup.nome   := oUsuarioLogado.nome;
    UsuarioBackup.senha  := oUsuarioLogado.senha;

    frmLogin := TfrmLogin.Create(Application);// cria a tela de login

    frmLogin.TrocaUsuario := True; // informa pra tela que é troca de usuário (não é login inicial)

    try
      if frmLogin.ShowModal = mrCancel then
      // abre o login de forma modal (trava o resto do sistema)
      // se retornar mrCancel significa que o usuário desistiu

      begin
        // restaura usuário anterior
        oUsuarioLogado.codigo := UsuarioBackup.codigo;
        // volta o código antigo

        oUsuarioLogado.nome   := UsuarioBackup.nome;
        // volta o nome antigo

        oUsuarioLogado.senha  := UsuarioBackup.senha;
        // volta a senha antiga

        Exit;
        // sai da procedure e não troca nada
      end;

      // login OK  status atualizado
      stbPrincipal.Panels[0].Text := 'USUÁRIO: ' + oUsuarioLogado.nome;
      ShowMessage('Usuário Alterado!');
      // aqui chegou porque foi mrOk → login deu certo
      // então atualiza o status bar com o novo usuário

    finally
      FreeAndNil(frmLogin);
      // libera a tela de login da memória
    end;

  finally
    // libera o backup da memória
    UsuarioBackup.Free;

  end;
end;

procedure TfrmPrincipal.tmrAtualizacaoDashBoardTimer(Sender: TObject);
begin
 AtualizarDashBoard;
end;

procedure TfrmPrincipal.mniPRODUTOSPORCATEGORIA1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelProdutoComCategoria, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mniUSURIO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadUsuario, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mniUSURIOSVSAES1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmUsuarioVsAcoes, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mniFichaCliente1Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelClienteFicha, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.CLIENTE2Click(Sender: TObject);
begin
  TFuncao.CriarRelatorio(TfrmRelCliente, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmPrincipal.MOVIMENTAO1Click(Sender: TObject);
begin
 tmrAtualizacaoDashBoard.Enabled:=False;
end;

procedure TfrmPrincipal.PRODUTO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadProduto, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.VENDAPORDATA1Click(Sender: TObject);
begin
  Try
   frmSelecionarData:=TfrmSelecionarData.Create(Self);
   if TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, 'frmRelVendaPorData', dtmConexao.ConexaoDB) then
   begin
     frmSelecionarData.ShowModal;

     frmRelVendaPorData:=TfrmRelVendaPorData.Create(Self);
     frmRelVendaPorData.QryVendaPorData.Close;
     frmRelVendaPorData.QryVendaPorData.ParamByName('DataInicio').AsDate:=frmSelecionarData.edtDataInicio.Date;
     frmRelVendaPorData.QryVendaPorData.ParamByName('DataFim').AsDate:=frmSelecionarData.edtDataDataFinal.Date;
     frmRelVendaPorData.QryVendaPorData.Open;
     frmRelVendaPorData.Relatorio.PreviewModal;
   end
   else begin
     MessageDlg('Usuário: '+oUsuarioLogado.nome +', não tem permissão de acesso',mtWarning,[mbOK],0);
   end;
  Finally
    if Assigned(frmSelecionarData) then
      frmSelecionarData.Release;
    if Assigned(frmRelVendaPorData) then
      frmRelVendaPorData.Release;
  End;
end;

procedure TfrmPrincipal.VENDAS1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmProVendas, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.AOACESSO1Click(Sender: TObject);
begin
  TFuncao.CriarForm(TfrmCadAcaoAcesso, oUsuarioLogado, dtmConexao.ConexaoDB);
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm:TfrmAtualizaDB);
var oAtualizarMSSQL:TAtualizaBancoDadosMSSQL;
begin
  aForm.Refresh;

  try
    oAtualizarMSSQL:=TAtualizaBancoDadosMSSQL.Create(dtmConexao.ConexaoDB);
    oAtualizarMSSQL.AtualizarBancoDeDadoMSSQL;
  finally
    if Assigned(oAtualizarMSSQL) then FreeAndNil(oAtualizarMSSQL);
  end;

  {with aForm, dtmConexao do begin
    chkConexao.Checked:=True;
    Refresh;

    QryScriptCategorias.ExecSQL;
    chkCategoria.Checked:=True;
    Refresh;
    Sleep(300);

    QryScriptProdutos.ExecSQL;
    chkProduto.Checked:=True;
    Sleep(300);

    QryScriptClientes.ExecSQL;
    chkCliente.Checked:=True;
    Refresh;
    Sleep(300);

    QryScriptVendas.ExecSQL;
    chkVendas.Checked:=True;
    Refresh;
    Sleep(300);

    QryScriptItemVendas.ExecSQL;
    chkItensVenda.Checked:=True;
    Refresh;
    Sleep(300);

    QryScriptUsuarios.ExecSQL;
    chkUsuarios.Checked:=True;
    Refresh;
    Sleep(300);
  end;}
end;

procedure TfrmPrincipal.AtualizarDashBoard;
begin
  try
    Screen.Cursor:=crSQLWait;
    if dtmGrafico.QryProdutoEstoque.Active then
     dtmGrafico.QryProdutoEstoque.Close;

  if dtmGrafico.QryVendaValorPorCliente.Active then
     dtmGrafico.QryVendaValorPorCliente.Close;

  if dtmGrafico.QryVendasDaUltimaSemana.Active then
     dtmGrafico.QryVendasDaUltimaSemana.Close;

  if dtmGrafico.QryProdutosMaisVendidos.Active then
     dtmGrafico.QryProdutosMaisVendidos.Close;

  dtmGrafico.QryProdutoEstoque.Open;
  dtmGrafico.QryVendaValorPorCliente.Open;
  dtmGrafico.QryVendasDaUltimaSemana.Open;
  dtmGrafico.QryProdutosMaisVendidos.Open;
  finally
    Screen.Cursor:=crDefault;
  end;

end;

end.
