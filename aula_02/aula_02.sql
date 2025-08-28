/*Exemplo 1*/
CREATE DATABASE TESTE
	ON (NAME = teste_dat,
	FILENAME = 'C:\aulas_sql\aula_02\teste_bd.mdf',
	SIZE = 10,
	MAXSIZE = 20,
	FILEGROWTH = 5)

/*Exemplo 2*/
ALTER DATABASE TESTE
	ADD FILE(
	NAME = arquivo_secundario_2,
	FILENAME = 'C:\aulas_sql\aula_02\teste_bd_22.ndf',
	SIZE = 11),
	(NAME = arquivo_seundario_3,
	FILENAME = 'C:\aulas_sql\aula_02\teste_bd_23.ndf',
	SIZE = 11)

/*Exemplo 3*/
ALTER DATABASE TESTE
	ADD LOG FILE(
	NAME = exemplo_03_log,
	FILENAME = 'C:\aulas_sql\aula_02\teste_bd_exemplo_03.ldf',
	SIZE = 12)

/*Exemplo 4*/

ALTER DATABASE TESTE
	REMOVE FILE arquivo_secundario_2

/*Exemplo 5*/

ALTER DATABASE TESTE
	MODIFY FILE(
	NAME = arquivo_secundario_2,
	SIZE = 20)


