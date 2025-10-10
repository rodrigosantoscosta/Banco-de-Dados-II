SELECT cliente.codigo, cliente.nome, cliente.fone 
FROM cliente
ORDER BY nome ASC

SELECT funcionario.codigo, funcionario.nome, funcionario.estcivil, funcionario.datanasc
FROM funcionario
ORDER BY datanasc DESC

SELECT codigo, nome, custo, venda, (venda - custo) AS 'Diferença'
FROM produto
ORDER BY Diferença DESC

SELECT codigo, nome, tipo FROM produto
ORDER BY tipo ASC, nome DESC

SELECT codigo , nome, cidade, sexo, salario
FROM funcionario
ORDER BY nome

SELECT * FROM funcionario
WHERE funcionario.datanasc > '01/01/1960' 
ORDER BY datanasc

SELECT nome, descricao, custo, venda,quantest FROM produto
WHERE quantest >= 30
ORDER BY venda DESC	

SELECT * FROM produto
WHERE quantest BETWEEN 10 AND 30
ORDER BY nome ASC

SELECT * FROM funcionario
WHERE datanasc BETWEEN '01/01/1960' AND '12/31/1969'
ORDER BY datanasc DESC, nome ASC

SELECT * FROM funcionario
WHERE bairro IN('Manaira','Bessa') ORDER BY nome

SELECT * FROM produto
WHERE tipo NOT IN(2,4)	
ORDER BY tipo DESC, nome

SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'M%'
ORDER BY nome ASC

SELECT codigo,nome FROM funcionario
WHERE nome LIKE '%SILVA'
ORDER BY nome ASC

SELECT codigo, nome FROM funcionario
WHERE nome LIKE '%Costa%'

SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'Mar_a %' ORDER BY nome

SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'Mar[i-t]a %'


SELECT codigo, nome, tipo, contato, fax FROM cliente
WHERE tipo = 'J' AND fax IS NOT NULL
ORDER BY nome ASC


select codigo, nome, salario, (YEAR(SYSDATETIME()) - YEAR(datanasc))  from funcionario
WHERE sexo = 'M' AND salario > 1000 AND (YEAR(SYSDATETIME()) - YEAR(datanasc)) BETWEEN 25 AND 60

select count(*) from cliente
select count(*) AS pedidosViaArea from pedido where via = 'A'

select SUM(salario * 1.32) AS AumentoSalario from funcionario
WHERE setor IN('COV', 'MKT')

SELECT SUM(frete) FROM pedido WHERE funcionario.codigo IN(2,6,8,10) AND YEAR(datafatura) = 1997
