SELECT setor.nome, funcionario.nome, setor.sigla FROM setor
INNER JOIN funcionario ON  setor.chefe = funcionario.codigo
ORDER BY setor.nome

SELECT 
    produto.codigo AS CodigoProduto,
	tipo.nome AS TipoProduto,
    COUNT(produto.codigo) AS QuantidadeProdutos,
    SUM(produto.quantest * produto.venda) AS ValorTotalTipo
FROM produto
INNER JOIN tipo ON tipo.codigo = produto.tipo
GROUP BY tipo.nome, 1;

SELECT 
    p.nome AS Produto,
    t.nome AS Tipo,
    p.quantest,
    p.venda,
    (p.quantest * p.venda) AS ValorTotalProduto,
    COUNT(p.codigo) OVER(PARTITION BY t.codigo) AS QuantidadeProdutosTipo,
    SUM(p.quantest * p.venda) OVER(PARTITION BY t.codigo) AS ValorTotalTipo
FROM produto AS p		
INNER JOIN tipo AS t ON t.codigo = p.tipo;


-- Totals by product and type
SELECT 
    tipo.nome AS TipoProduto,
    produto.nome AS Produto,
    produto.quantest,
    produto.venda,
    (produto.quantest * produto.venda) AS ValorTotal
FROM produto
INNER JOIN tipo ON tipo.codigo = produto.tipo

UNION ALL

-- Summary by type
SELECT 
    tipo.nome AS TipoProduto,
    'TOTAL POR TIPO' AS Produto,
    NULL AS quantest,
    NULL AS venda,
    SUM(produto.quantest * produto.venda) AS ValorTotal
FROM produto
INNER JOIN tipo ON tipo.codigo = produto.tipo
GROUP BY tipo.nome;


SELECT funcao.nome, funcionario.nome FROM funcao
LEFT JOIN funcionario
ON funcao.codigo = funcionario.funcao






SELECT produto.nome, tipo.nome FROM produto
RIGHT JOIN tipo ON tipo.codigo = produto.tipo
-- 06/11/2025
* Revisao de JOIN
Incluindo dados INSERT

INSERT cidade(codigo, nome, uf, pais)
VALUES(91, 'Muriaé','MG','BRA');
