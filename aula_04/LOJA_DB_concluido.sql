CREATE DATABASE Loja
	ON (NAME = loja_dat,
	FILENAME = 'D:\code\Banco-de-Dados-II\aula_04\loja.mdf',
	SIZE = 5,
	MAXSIZE = 10,
	FILEGROWTH = 1)
LOG ON
	(NAME = loja_log,
		FILENAME = 'D:\code\Banco-de-Dados-II\aula_04\loja.ldf',
		SIZE = 10,
		MAXSIZE = 50,
		FILEGROWTH = 10)

USE Loja

create table TblPais(
	sigla char(3) not null
		constraint pk_sigla primary key,
	nome varchar(15) not null
		constraint un_pais unique
)

create table TblCidade(
	codigo smallint not null
		constraint pk_cidade primary key,
	nome varchar(30) not null,
	uf char(2) not null,
	pais char(3) not null
		constraint fk_TblPais_pais foreign key
		references TblPais(sigla)
)

create table TblCliente(
	codigo char(5) not null
		constraint pk_cliente primary key,
	nome varchar(40) not null,
	tipo char(1) not null check ( tipo like '[FJ]' ),
	contato varchar(30),
	endereco varchar(50) not null,
	cidade smallint not null
		constraint fk_TblCidade_cidade foreign key
		references TblCidade(codigo),
	cep varchar(10),
	fone varchar(16),
	fax varchar(16),
	obs text
)

create table TblFuncao(
	codigo smallint not null
		constraint pk_funcao primary key,
	nome varchar(30) not null
		constraint un_funcao unique,
	gratific smallmoney not null
)

create table TblFuncionario(
	codigo tinyint not null
		constraint pk_funcionario primary key,
	nome varchar(40) not null,
	sexo char(1) not null check ( sexo like '[FM]' ),
	estcivil char(1) not null check ( estcivil like '[SCVO]' ),
	rg varchar(15) not null
		constraint un_funcionario_rg unique,
	cpf varchar(12) not null
		constraint un_funcionario_cpf unique,
	trat varchar(4) not null constraint ck_TblFuncionario_trat check (trat in ('Sr', 'Sra', 'Srta', 'Dr', 'Dra')),
	datanasc smalldatetime not null,
	dataadm smalldatetime not null,
	natural smallint not null
		constraint fk_TblCidade_natural foreign key
		references TblCidade(codigo),
	endereco varchar(40) not null,
	compl varchar(20),
	bairro varchar(20),
	reside smallint not null
		constraint fk_TblCidade_reside foreign key
		references TblCidade(codigo),
	cep varchar(10),
	fone varchar(10),
	celular varchar(10),
	funcao smallint
		constraint fk_TblFuncao_funcao foreign key
		references TblFuncao(codigo),
	--setor char(3) not null
	--	constraint fk_TblSetor_setor foreign key
	--	references TblSetor(sigla),
	salario smallmoney not null,
	email varchar(40),
	obs text
)

create table TblSetor(
	sigla char(3) not null
		constraint pk_setor primary key,
	nome varchar(30) not null
		constraint un_setor unique,
	ramal smallint,
	superior char(3)
		constraint fk_TblSetor_superior foreign key
		references TblSetor(sigla),
	chefe tinyint
		constraint fk_TblSetor_chefe foreign key
		references TblFuncionario(codigo),
)



CREATE TABLE TblTipo(
	codigo tinyint not null
		constraint pk_tipo primary key,
	nome varchar(15) not null
		constraint un_tipo unique,
	descricao text,
)

CREATE TABLE TblProduto(
	codigo smallint NOT NULL
		CONSTRAINT pk_produto PRIMARY KEY,
	nome varchar(40) not null
		CONSTRAINT un_produto UNIQUE,
	descricao varchar(45) not null,
	apresent varchar(3) not null,
	venda smallmoney not null,
	custo smallmoney not null,
	quantest smallint not null,
	estmin smallint,
	tipo tinyint not null
		constraint fk_produto_tipo foreign key
			references TblTipo(codigo),
	situacao char(1)
		constraint ck_produto_situacao CHECK ( situacao LIKE '[NDS]' ), 
)



create table TblPedido(
	codigo smallint not null
		constraint pk_pedido primary key,
	cliente char(5) not null
		constraint fk_pedido_cliente foreign key
		references TblCliente(codigo),
	vendedor tinyint not null
		constraint fk_pedido_vendedor foreign key
		references TblFuncionario(codigo),
	datapedid smalldatetime not null,
	datafatura smalldatetime,
)

create table TblItens(
	pedido smallint not null,
	produto smallint not null,
		constraint pk_itens primary key(pedido,produto),
		constraint fk_itens_pedido foreign key(pedido)
			references TblPedido(codigo),
		constraint fk_itens_produto foreign key(produto)
			references TblProduto(codigo),
	preco smallmoney not null,
	quant smallint not null,
	descont decimal(4,1) not null,
)