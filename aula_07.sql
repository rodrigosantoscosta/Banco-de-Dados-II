-- Aula 

-- Exemplo 1 
SELECT sexo, count(sexo) quantidade FROM funcionario
GROUP BY sexo

SELECT COUNT(*) FROM pedido
GROUP BY datapedid

--Exemplo 3

--Agrupando informações

SELECT COUNT(codigo) AS Quantidade, SUM(venda) AS  ValorTotal, AVG(custo) AS CustoMedio, AVG(venda) AS CustoVenda FROM produto
GROUP BY tipo

SELECT pedido, COUNT(produto) AS Quantidade FROM itens
GROUP BY pedido HAVING COUNT(pedido) > 4


--GROUP BY Exercicios de Fixação

SELECT pedido, MAX(quant) AS MaiorQuantidadeDoPedido FROM itens
GROUP BY pedido

SELECT setor, SUM(salario) AS TotalSalarios FROM funcionario
GROUP BY setor  HAVING SUM(salario) > $5000.0

SELECT tipo, AVG(custo) AS MediaCusto, AVG(venda) AS MediaVenda, (AVG(venda) - AVG(custo)) As Diferença FROM produto
GROUP BY tipo

SELECT produto, COUNT(pedido) FROM itens
GROUP BY produto HAVING COUNT(pedido) > 20

SELECT nome, AVG(YEAR(getdate()) - YEAR(datanasc)) FROM funcionario
GROUP BY setor HAVING AVG(YEAR(getdate()) - datanasc) < 60