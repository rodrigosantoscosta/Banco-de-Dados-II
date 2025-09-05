CREATE DATABASE academia;
USE academia;

CREATE TABLE TblAluno(
	matricula int not null,
	nome char(100) not null,
	data_nascimento date not null,
	email varchar(20) not null,
	cpf char(12) not null,
	celular varchar(12) not null)

CREATE TABLE TblMensalidade(
	descricao varchar(100) not null,
	valor smallmoney not null,
	caracteristica varchar(20) not null)

CREATE TABLE TblAcademia(
	razao_social varchar(50) not null,
	cnpj char(12) not null,
	endereco varchar(50) not null,
	cidade varchar(50) not null,
	estado varchar(20) not null,
	telefone char(12) not null)

CREATE TABLE TblFicha(
	nome_aluno varchar(50) not null,
	nome_do_professor varchar(50) not null,
	exercicio varchar(50) not null,
	repeticoes int not null,
	peso float not null)

CREATE TABLE TblProfessor(
	matricula char(10) not null
		constraint pk_professor PRIMARY KEY,
	cpf varchar(12) NOT NULL
		constraint un_professor_cpf UNIQUE,
	nome varchar(100) not null,
	celular char(12) not null) 

CREATE TABLE TblCidade(
	codigo varchar(50) not null
		constraint pk_cidade PRIMARY KEY,
	nome varchar(50) not null)

CREATE TABLE TblPessoa(
	codigo char(10) not null
		constraint pk_codigo PRIMARY KEY,
	cpf char(12) not null
		constraint un_pessoa_cpf UNIQUE,
	cidade varchar(50) not null
		constraint fk_pessoa_cidade FOREIGN KEY
		references TblCidade(codigo)
	)


CREATE TABLE TblFuncionario(
	matricula char(10) not null
		CONSTRAINT pk_matricula PRIMARY KEY,
	nome varchar(100),
	cpf char(12) not null
		constraint un_funcionario_cpf UNIQUE KEY,
	nacionalidade varchar(20)
		constraint DF_FUNCIONARIO_NAC DEFAULT 'Brasil'

	)
