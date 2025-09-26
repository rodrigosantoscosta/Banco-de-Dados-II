SELECT * FROM cliente
SELECT * FROM funcionario
SELECT * FROM produto

SELECT codigo, nome, fone FROM cliente
SELECT codigo, nome, estcivil FROM funcionario
SELECT codigo, nome, custo, venda FROM produto
SELECT TOP 20 codigo, nome, fone FROM cliente
SELECT TOP 10 PERCENT codigo, nome, custo, venda FROM produto
SELECT codigo, nome, fone, 'não classificado' FROM cliente
SELECT codigo, nome, custo, venda  'Núm Referência' FROM produto

SELECT codigo, nome, fone, 'não classificado'  AS 'Classificação'
FROM cliente

SELECT codigo, nome, custo, 'não classificado'  AS 'Produto'
FROM produto

SELECT DISTINCT  cliente FROM pedido
SELECT cliente FROM pedido
SELECT codigo, quantest *venda 'Valor Total' FROM produto

--Exercicio de fixação
SELECT codigo, nome AS 'Produto', quantest AS 'Estoque Real', 
estmin AS 'Estoque Minimo', 'Num. Ref' AS 'Referencia'  FROM produto

SELECT * , venda - custo AS 'Diferença' FROM produto

SELECT *, 1.25 * venda AS 'Aumento de 25%' FROM produto
