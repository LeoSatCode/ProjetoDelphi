program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'Data Module\uDTMConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategoria in 'Cadastro\uCadCategoria.pas' {frmCadCategoria},
  Enter in 'terceiros\Enter.pas',
  uEnum in 'uEnum.pas',
  cCadCategoria in 'Classes\cCadCategoria.pas',
  uCadCliente in 'Cadastro\uCadCliente.pas' {frmCadCliente},
  cCadCliente in 'Classes\cCadCliente.pas',
  uCadProduto in 'Cadastro\uCadProduto.pas' {frmCadProduto},
  cCadProduto in 'Classes\cCadProduto.pas',
  ufrmAtualizaDB in 'Data Module\ufrmAtualizaDB.pas' {frmAtualizaDB},
  uDTMVenda in 'Data Module\uDTMVenda.pas' {dtmVenda: TDataModule},
  uProVenda in 'Processo\uProVenda.pas' {frmProVendas},
  cProVendas in 'Classes\cProVendas.pas' {frmProVendas},
  cControleEstoque in 'Classes\cControleEstoque.pas',
  uRelCadClienteFicha in 'Relatorio\uRelCadClienteFicha.pas' {frmRelClienteFicha},
  uRelGenerico in 'Relatorio\uRelGenerico.pas' {frmGenerico},
  uRelCadCliente in 'Relatorio\uRelCadCliente.pas' {frmRelCliente},
  uRelCategoria in 'Relatorio\uRelCategoria.pas' {frmRelCategoria},
  uRelProduto in 'Relatorio\uRelProduto.pas' {frmRelProduto},
  uSelecionarData in 'Relatorio\uSelecionarData.pas' {frmSelecionarData},
  uRelProdutoComCategoria in 'Relatorio\uRelProdutoComCategoria.pas' {frmRelProdutoComCategoria},
  uRelVendaPorData in 'Relatorio\uRelVendaPorData.pas' {frmRelVendaPorData},
  uCadUsuario in 'Cadastro\uCadUsuario.pas' {frmCadUsuario},
  uFuncaoCriptografia in 'Heranca\uFuncaoCriptografia.pas',
  cCadUsuario in 'Classes\cCadUsuario.pas',
  uLogin in 'Login\uLogin.pas' {frmLogin},
  uAlterarSenha in 'Login\uAlterarSenha.pas' {frmAlterarSenha},
  cUsuarioLogado in 'Classes\cUsuarioLogado.pas',
  cAtualizacaoBandoDeDados in 'Classes\cAtualizacaoBandoDeDados.pas',
  cAtualizacaoTabelaMSSQL in 'Classes\cAtualizacaoTabelaMSSQL.pas',
  cAtualizacaoCampoMSSQL in 'Classes\cAtualizacaoCampoMSSQL.pas',
  cArquivoIni in 'Classes\cArquivoIni.pas',
  cAcaoAcesso in 'Classes\cAcaoAcesso.pas',
  uCadAcaoAcesso in 'Cadastro\uCadAcaoAcesso.pas' {frmCadAcaoAcesso},
  uUsuarioVsAcoes in 'Login\uUsuarioVsAcoes.pas' {frmUsuarioVsAcoes},
  uDTMGrafico in 'Data Module\uDTMGrafico.pas' {dtmGrafico: TDataModule},
  cFuncao in 'Classes\cFuncao.pas',
  uTelaHerancaConsulta in 'Heranca\uTelaHerancaConsulta.pas' {frmTelaHerancaConsulta},
  uConCategoria in 'Consulta\uConCategoria.pas' {frmConCategoria},
  cValidacoes in 'Classes\cValidacoes.pas',
  uConCliente in 'Consulta\uConCliente.pas' {frmConCliente},
  Vcl.Themes,
  Vcl.Styles,
  uCaixa in 'Processo\uCaixa.pas' {frmCaixa},
  cRelatorio in 'Classes\cRelatorio.pas',
  uRelPreVenda in 'Relatorio\uRelPreVenda.pas' {frmRelPreVenda},
  uRelProVenda in 'Relatorio\uRelProVenda.pas' {frmRelProVenda},
  cCaixa in 'Classes\cCaixa.pas',
  cGridUtils in 'Classes\cGridUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelPreVenda, frmRelPreVenda);
  Application.CreateForm(TfrmRelProVenda, frmRelProVenda);
  Application.Run;
end.
