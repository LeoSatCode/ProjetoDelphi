unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
     Vcl.Controls, cAtualizacaoBandoDeDados,
     Vcl.ExtCtrls, System.SysUtils,
     Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Error, FireDAC.UI.Intf,
     FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
     FireDAC.Stan.Async,FireDAC.Phys, FireDAC.Phys.MSSQL,
     FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
     FireDAC.Comp.Client,uDTMConexao,cCadUsuario;

type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)

  private
    function TabelaExiste(aNomeTabela:string):Boolean;
    procedure Categoria;
    procedure situacaoCliente;
    procedure Cliente;
    procedure Produto;
    procedure Usuario;
    procedure Vendas;
    procedure VendasItens;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;
    procedure PreVenda;
    procedure PreVendaItens;

  protected

  public
    constructor Create(aConexao:TFDConnection);
    destructor Destroy; override;
  end;

implementation

{ TAtualizacaoTableMSSQL }

constructor TAtualizacaoTableMSSQL.Create(aConexao: TFDConnection);
begin
  ConexaoDB := aConexao;

  Categoria;
  situacaoCliente;
  Cliente;
  Produto;
  Usuario;
  AcaoAcesso;
  UsuariosAcaoAcesso;
  Vendas;
  VendasItens;
  PreVenda;
  PreVendaItens;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin

  inherited;
end;

function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: string): Boolean;
var Qry:TFDQuery;
begin
  try
    Result:=False;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT OBJECT_ID (:NomeTabela) AS ID ');
    Qry.ParamByName('NomeTabela').AsString:=aNomeTabela;
    Qry.Open;

    if Qry.FieldByName('ID').AsInteger>0 then
       Result:=True;
  finally
    Qry.Close;
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin
  if not TabelaExiste('categorias') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE categorias( ' +
      '   categoriaId int IDENTITY(1,1) NOT NULL, '+
      '    descricao varchar(30) NULL, ' +
      '    PRIMARY KEY (categoriaId) '+
      ') '
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.Produto;
begin
  if not TabelaExiste('produtos') then
  begin
    ExecutaDiretoBancoDeDados(
    ' create table produtos( '+
    '   produtoId int identity(1,1) not null, '+
    '   nome varchar(60) null, '+
    '   descricao varchar(255) null, '+
    '   valor decimal(18,5) default 0.00000 null, '+
    '   quantidade decimal (18,5) default 0.00000 null, '+
    '   categoriaId int null, '+
    '   primary key (produtoId), '+
    '   foto varbinary(max) null, '+
    '   constraint FK_ProdutoCategorias '+
    '   foreign key (categoriaId) references categorias (categoriaId) '+
    ' ) '
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.situacaoCliente;
begin
  if not TabelaExiste('situacao') then
  begin
    ExecutaDiretoBancoDeDados(
    'CREATE TABLE situacao ( '+
    '  situacaoId INT IDENTITY(1,1) PRIMARY KEY, '+
    '  situacaoCliente VARCHAR(20) '+
    ')'
    );

    ExecutaDiretoBancoDeDados(
    'INSERT INTO situacao (situacaoCliente) VALUES '+
    ' (''ATIVO''), '+
    ' (''BLOQUEADO''), '+
    ' (''ATENÇÃO''), '+
    ' (''INATIVO''), '+
    ' (''PROSPECTO'')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Usuario;
Var oUsuario:TUsuario;
begin
  if not TabelaExiste('usuarios') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE usuarios ( '+
	  '   usuarioId INT IDENTITY(1,1) NOT NULL, '+
    '   nome VARCHAR(50) NOT NULL, '+
    '   senha VARCHAR(40) NOT NULL, '+
	  '   PRIMARY KEY (usuarioId) '+
    ' ) '
  );
  end;

  try
    oUsuario:=TUsuario.Create(ConexaoDB);
    oUsuario.nome:='admin';
    oUsuario.senha:='admin';
    if not oUsuario.UsuarioExiste(oUsuario.nome) then
      oUsuario.Inserir;
  finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  end;
end;

procedure TAtualizacaoTableMSSQL.Cliente;
begin
  if not TabelaExiste('clientes') then
  begin
    ExecutaDiretoBancoDeDados(
    '  CREATE TABLE clientes ( '+
    '   clienteId INT IDENTITY(1,1) NOT NULL, '+
    '   nome varchar(60) NULL, '+
    '   documento varchar (18) unique, '+
    '   endereco varchar(60) NULL, '+
    '   cidade varchar(50) NULL, '+
    '   bairro varchar(40) NULL, '+
    '   estado varchar(2) NULL, '+
    '   cep varchar(10) NULL, '+
    '   numero varchar(5) NULL, '+
    '   telefone varchar(14) NULL, '+
    '   email varchar(100) NULL, '+
    '   observacao varchar(200) NULL, '+
    '   dataNascimento datetime NULL, '+
    '   situacaoId INT NULL, '+
    '   PRIMARY KEY (clienteId), '+
    '   CONSTRAINT FK_clientes_situacao FOREIGN KEY (situacaoId) '+
    '     REFERENCES situacao(situacaoId) '+
    ' ) '
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.Vendas;
begin
  if not TabelaExiste('Vendas') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE Vendas ( '+
    '   vendaId INT IDENTITY(1,1) NOT NULL, '+
    '   clienteId INT NOT NULL, '+
    '   dataVenda DATETIME DEFAULT GETDATE(), '+
    '   totalVenda decimal(18,5) default 0.00000, '+
    '   CONSTRAINT PK_Vendas PRIMARY KEY (vendaId), '+
    '   CONSTRAINT FK_Vendas_Clientes FOREIGN KEY (clienteId) '+
    '   REFERENCES Clientes(clienteId) '+
    ' )'
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.VendasItens;
begin
  if not TabelaExiste('vendasItens') then
  begin
    ExecutaDiretoBancoDeDados(
    ' CREATE TABLE vendasItens ( '+
    '   vendaId INT NOT NULL, '+
    '   produtoId INT NOT NULL,  '+
    '   valorUnitario DECIMAL(18,5) DEFAULT 0.00000,  '+
    '   quantidade DECIMAL(18,5) DEFAULT 0.00000, '+
    '   totalProduto DECIMAL(18,5) DEFAULT 0.00000, '+
    '   PRIMARY KEY (vendaId, produtoId), '+
    '   CONSTRAINT FK_VendasItensProdutos '+
    '   FOREIGN KEY (produtoId) '+
    '   REFERENCES produtos (produtoId) '+
    ' ) '
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin
  if not TabelaExiste('acaoAcesso') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE acaoAcesso ( '+
	    '   acaoAcessoId INT IDENTITY(1,1) NOT NULL, '+
      '   descricao VARCHAR(100) NOT NULL, '+
      '   chave VARCHAR(60) NOT NULL, '+
	    '   PRIMARY KEY (acaoAcessoId) '+
      ' ) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
begin
  if not TabelaExiste('usuariosAcaoAcesso') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE usuariosAcaoAcesso ( '+
      '   usuarioId INT NOT NULL, '+  //Aqui garantimos que os registros de usuarioId e acaoAcessoId pertencem a uma
      '   acaoAcessoId INT NOT NULL,  '+  //outra tabela, por isso temos as Foreign Key (Chave Estrangeira)
      '   ativo BIT NOT NULL DEFAULT 1,  '+  //BIT é um Boolean.
      '   PRIMARY KEY (usuarioId, acaoAcessoId), '+
      '   CONSTRAINT FK_UsuarioAcaoAcessoUsuario '+
      '   FOREIGN KEY (usuarioId) REFERENCES usuarios(usuarioId), '+
      '   CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso '+
      '   FOREIGN KEY (acaoAcessoId) REFERENCES acaoAcesso(acaoAcessoId) '+
      ' ) '
      //NOTA: Esses Foreign Key's, são para garantir que na tabela só existam usuários já cadastrados
      //e ações que já estão cadastradas nas tabelas referenciadas à ação.
  );
  end;
end;

procedure TAtualizacaoTableMSSQL.PreVenda;
begin
  if not TabelaExiste('preVenda') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE preVenda ( '+
      '   preVendaId INT IDENTITY(1,1) NOT NULL, '+
      '   clienteId INT NOT NULL, '+
      '   dataEmissao DATETIME NOT NULL, '+
      '   dataValidade DATETIME NOT NULL, '+
      '   totalVenda DECIMAL(18,5) NOT NULL, '+
      '   status VARCHAR(20) NOT NULL DEFAULT ''PENDENTE'', '+
      '   PRIMARY KEY (preVendaId), '+
      '   CONSTRAINT FK_PreVendaCliente '+
      '   FOREIGN KEY (clienteId) REFERENCES clientes(clienteId) '+
      ' ) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.PreVendaItens;
begin
  if not TabelaExiste('preVendaItens') then
  begin
    ExecutaDiretoBancoDeDados(
      ' CREATE TABLE preVendaItens ( '+
      '   preVendaItemId INT IDENTITY(1,1) NOT NULL, '+
      '   preVendaId INT NOT NULL, '+
      '   produtoId INT NOT NULL, '+
      '   quantidade DECIMAL(18,5) NOT NULL, '+
      '   valorUnitario DECIMAL(18,5) NOT NULL, '+
      '   totalProduto DECIMAL(18,5) NOT NULL, '+
      '   PRIMARY KEY (preVendaItemId), '+
      '   CONSTRAINT FK_PreVendaItensPreVenda '+
      '   FOREIGN KEY (preVendaId) REFERENCES preVenda(preVendaId) ON DELETE CASCADE, '+
      '   CONSTRAINT FK_PreVendaItensProduto '+
      '   FOREIGN KEY (produtoId) REFERENCES produtos(produtoId) '+
      ' ) '
    );
  end;
end;
end.
