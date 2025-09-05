CREATE DATABASE teste_bd_aula_01
	ON (NAME = teste_dat,
	FILENAME = 'C:\aulas_sql\aula_01\teste_bd.mdf',
	SIZE = 5,
	MAXSIZE = 20,
	FILEGROWTH = 5)
LOG ON
	(NAME = teste_log,
		FILENAME = 'C:\aulas_sql\aula_01\teste_bd.ldf',
		SIZE = 10,
		MAXSIZE = 50,
		FILEGROWTH = 10)
	