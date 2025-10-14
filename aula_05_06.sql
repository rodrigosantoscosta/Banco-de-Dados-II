-- Ordenando os Resultados

--SELECT <lista de colunas,expressão> FROM <tabela>
--ORDER BY <coluna> [ASC] [DESC]

--Exemplo1: Exibir código, nome e telefone de todos os clientes,
--ordenado pelo nome do cliente em ordem ascendente;

SELECT codigo, nome, contato FROM cliente
ORDER BY nome ASC

--Exemplo2: Exibir código, nome, estado civil e data de nascimento de
--todos os funcionários, ordenados pela data de nascimento em ordem
--descendente.

SELECT codigo, nome, estcivil, datanasc FROM funcionario
ORDER BY datanasc DESC

--Exemplo3: Exibir código, nome, preço de custo, preço de venda e a
--diferença entre esses dois preços para todos os produtos, ordenados
--pela diferença de preço em ordem descendente;

SELECT nome, custo, venda, (venda - custo) AS 'Diferenca' FROM produto
ORDER BY Diferenca DESC

--Exemplo4: Exibir código, nome e tipo de todos os produtos existentes
--na empresa, ordenados pelo tipo em ordem ascendente e pelo nome
--do produto em ordem descendente;

SELECT codigo, nome, tipo FROM produto
ORDER BY tipo ASC, nome DESC

--Exemplo5: Exibir código, nome, cidade, sexo e salário de todos os
--funcionários da empresa, ordenados por cidade e sexo com ordem
--ascendente e por salário em ordem descendente;

SELECT codigo, nome, cidade, sexo FROM funcionario
ORDER BY cidade ASC, sexo DESC

--Exemplo6: Exibir código, nome, descrição, tipo, preço de venda e
--quantidade em estoque de todos os produtos existentes na empresa,
--ordenados pelo tipo em ordem descendente e pelo preço de venda em
--ordem ascendente;

SELECT codigo, nome, descricao, tipo, venda, quantest FROM produto
ORDER BY tipo DESC, venda ASC

---------------------------------------------------------------------------

--Filtrando os Dados

--SELECT <lista de colunas> FROM <tabela>
--WHERE <coluna OPERADOR expressão>

--Exemplo1: Exibir todos os dados dos funcionários que nasceram a
--partir de 1960, ordenados pela data de nascimento;

SELECT * FROM funcionario                                                                       
WHERE datanasc > '31-12-1959'  -- O formato da data depende do LANGUAGE da sessão			
ORDER BY datanasc DESC, nome						-- e do DATEFORMAT mdy, dmy, ymd	


--Exemplo2: Exibir nome, descrição, preço de custo, preço de venda e
--quantidade em estoque dos produtos com preço de venda maior ou
--igual a R$ 30,00, ordenados pelo preço de venda em ordem
--decrescente.

SELECT nome, descricao, custo, venda, quantest
FROM produto WHERE venda >= 30 ORDER BY venda DESC

--Filtrando Dados usando Intervalos
--SELECT <lista de colunas> FROM <tabela>
--WHERE <coluna BETWEEN intervalo>

--Exemplo1: Exibir todos os dados dos produtos com estoque entre 10 e
--30 unidades, ordenados pelo nome do produto em ordem ascendente;

SELECT * FROM produto
WHERE quantest BETWEEN 10 AND 30
ORDER BY nome ASC

--Exemplo2: Exibir todos os dados dos funcionários que nasceram na
--década de 60, ordenados pela data de nascimento em ordem
--descendente e pelo nome do funcionário em ordem ascendente

SELECT * FROM funcionario
WHERE YEAR(datanasc) BETWEEN '1960' AND '1969' --isso é lento em tabelas grandes por impedir o uso de indice nas consultas
ORDER BY datanasc, nome ASC						-- melhor usar um intervalo de datas '1960-01-01' AND '1969-12-31'


--Filtrando Dados usando Listas

--SELECT <lista de colunas> FROM <tabela>
--WHERE <coluna IN lista>

--Exemplo1: Exibir todos os dados dos funcionários da empresa que
--residam em Manaíra ou Bessa, ordenados pelo nome em ordem
--ascendente;

SELECT * FROM funcionario
WHERE bairro IN ('Manaira', 'Bessa')
ORDER BY nome ASC


--Exemplo2: Exibir todos os produtos que não sejam do tipo 2 ou 4,
--ordenados pelo tipo em ordem descendente e pelo nome em ordem
--ascendente;

SELECT * FROM produto
WHERE tipo NOT IN (2,4) ORDER BY tipo DESC, nome ASC

--Filtrando Dados com Valores Nulos

--SELECT <lista de colunas> FROM <tabela>
--WHERE <coluna > IS NULL

--Exemplo1: Exibir todos os dados dos funcionários que não tenham
--email, ordenados pelo nome em ordem ascendente;

SELECT * FROM funcionario
WHERE email IS NULL
ORDER BY nome ASC

--Exemplo2: Exibir todos os funcionários cujo número do telefone seja
--conhecido, ordenados pelo nome do funcionário em ordem
--ascendente;

SELECT nome, celular FROM funcionario
WHERE celular IS NOT NULL
ORDER BY nome ASC

--Filtrando Dados usando Strings

--SELECT <lista de colunas> FROM <tabela>
--WHERE <coluna > LIKE <string>

--Exemplo1: Exibir código e nome de todos os funcionários que tenham o nome
--começando por “M”, ordenados pelo nome em ordem ascendente;

SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'M%' ORDER BY nome

--Exemplo2: Exibir código e nome de todos os funcionários que tenham o nome terminado
--por “Silva”, ordenados pelo nome em ordem ascendente;

SELECT codigo, nome FROM funcionario
WHERE nome LIKE '% Silva' ORDER BY nome

--Exemplo3: Exibir código e nome de todos os funcionários que tenham “Costa” em
--qualquer parte do nome;

SELECT codigo, nome FROM funcionario
WHERE nome LIKE '%Costa%'

--Exemplo4: Exibir código e nome de todos os funcionários que tenham na primeira
--palavra o nome começando por “Mar” seguido de um caractere qualquer e terminado por
--“a” no primeiro nome, ordenados pelo nome;

SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'Mar_a %' ORDER BY nome

--Exemplo5: Exibir código e nome de todos os funcionários que tenham o primeiro nome
--começando por “Mar” seguido de um caractere qualquer entre “i“ e “t” e terminado por
--“a”;
SELECT codigo, nome FROM funcionario
WHERE nome LIKE 'Mar[i-t]a % '

--Exemplo6: Exibir código e nome de todos os clientes cujo código não comece por “A”
--nem por “C”, ordenados pelo código;

SELECT codigo, nome FROM cliente
WHERE codigo NOT LIKE '[AC]%' ORDER BY codigo

--Exemplo7: Exibir código e nome de todos os clientes, cujo código tenha a letra “A” como
--segundo caractere;

SELECT codigo, nome FROM cliente
WHERE codigo LIKE '_A%'

--Exemplo8: Exibir código e nome de todos os funcionários, que possuam a string
--“Bacharelado” na coluna OBS.

SELECT codigo, nome FROM funcionario
WHERE OBS LIKE '%Bacharelado%'

-- Filtrando Dados com Condições Compostas

-- SELECT <lista de colunas> FROM <tabela>
-- WHERE <condicao 1> <AND|OR> <condicao 2><AND|OR> <condicao n>

-- Exemplo1: Exibir código, nome, tipo, telefone e fax dos clientes que
-- sejam pessoa jurídica e que possuam fax, ordenados pelo nome em
-- ordem ascendente;

SELECT codigo, nome, tipo, contato, fax FROM cliente
WHERE tipo = 'J' AND fax IS NOT NULL ORDER BY nome

-- Exemplo2: Exibir todos os produtos com quantidade em estoque maior
-- que 100 ou preço de custo menor ou igual a R$ 10,00

SELECT nome, quantest FROM produto
WHERE quantest > 100 OR custo <= $10.00

-- Exemplo3: Exibir código, nome, salário e idade de todos os
-- funcionários homens com salário superior a R$ 1.000,00 e com idade
-- entre 25 e 60 anos;

SELECT codigo, nome, salario, YEAR(getdate()) - YEAR(datanasc) AS idade FROM funcionario
WHERE sexo = 'M' AND salario >= $1000.0 AND YEAR(getdate()) - YEAR(datanasc) BETWEEN 25 AND 60

-- Exemplo4: Exibir todos os produtos com tipo igual a 1,2 ou 5 e
-- quantidade em estoque maior ou igual a 10, ou que tenham preço de
-- venda superior a R$ 50,00 e tipo diferente de 1,4 ou 6;

SELECT nome, tipo, quantest FROM produto
WHERE (tipo IN (1,2,5) AND quantest >= 10) OR (venda >= $50.00 AND tipo  NOT IN (1,4,6))

--Usando Funções de Agregação
--As funções de agregação:
--● Operam na coleta de valores de uma coluna da tabela;
--● Produzem um resultado único;
--● Geram valores sumarizados;
--● Não atuam sobre valores nulos;
--● São usadas na lista de colunas do SELECT
--● COUNT(): Conta o número de valores de uma coluna.
--● SUM(): Soma os valores de uma coluna de dados numéricos.
--● AVG(): Calcula a média de uma coluna de dados numéricos.
--● MAX(): Determina o maior valor de uma coluna.
--● MIN(): Determina o menor valor de uma coluna.
--● A cláusula DISTINCT pode ser usada como parte do argumento para
--eliminar linhas repetidas antes de aplicar a função.


--Exemplo1: Exibir quantos clientes têm cadastro na empresa;

SELECT COUNT(*) AS 'TotalDeClientes' FROM cliente

--Exemplo2: Exibir quantos pedidos foram enviados por via aérea;

SELECT COUNT(*) AS 'TotalDePedidosPorViaArea' FROM pedido
WHERE via = 'A'

--Exemplo3: Exibir quantos funcionários tem email;

SELECT COUNT(*) AS 'TotalFuncionariosComEmail' FROM funcionario
WHERE email IS NOT NULL

--Exemplo4: Exibir quantas cidades a empresa atende;

SELECT COUNT(DISTINCT cidade) FROM cliente

--Exemplo5: Exibir quantos vendedores já atenderam pedido;

SELECT COUNT(DISTINCT vendedor) AS 'VendedoresComPedido' FROM pedido

--Totalizando Colunas - SUM()

--Exemplo1: Exibir a soma de todos os salários da empresa;

SELECT SUM(salario) FROM funcionario

--Exemplo2: Exibir a soma de todos os salários dos funcionários dos
--setores “Compras e Vendas”(COV) e “Marketing” (MKT) com um
--aumento de 32%;

SELECT SUM(salario) * 1.32 FROM funcionario
WHERE setor  IN ('COV','MKT')

--Exemplo3: Exibir o total pago pelo frete dos pedidos atendidos pelos
--funcionários de código 2,6,8 e 10 durante o ano de 1997

SELECT SUM(frete) AS 'TotalFrete' FROM pedido
WHERE vendedor IN (2,6,8,10) AND YEAR(datapedid) = '1997'


--Calculando Médias - AVG()

--Exemplo1: Exibir a média dos salários da empresa;


SELECT AVG(salario) FROM funcionario

--Exemplo2: Exibir o preço médio de venda dos produtos do tipo 1;

SELECT AVG(venda) FROM produto
WHERE tipo = '1' 

--Exemplo3: Exibir a idade média das funcionárias do setor COV;

SELECT AVG(YEAR(getdate()) - YEAR(datanasc)) AS idade FROM funcionario
WHERE sexo = 'F' AND  setor = 'COV'

SELECT AVG(YEAR(getdate()) - YEAR(datanasc)) AS Idade
FROM funcionario
WHERE sexo = 'F' AND setor = 'COV'

--Exemplo4: Exibir a média de salário dos funcionários com salário entre R$ 400,00 e R$ 800,00 
--que não sejam casados nem viúvos;

SELECT  AVG(salario) FROM funcionario
WHERE salario BETWEEN $400.00 AND $800.00 AND estcivil NOT IN ('C','V')


--Usando valores Máximos (MAX()) e Mínimos (MIN())

--Exemplo1: Exibir o preço do produto mais caro vendido na empresa

SELECT MAX(venda) FROM produto

--Exemplo2: Exibir a data de nascimento do homem mais velho da
--empresa;

SELECT MIN(datanasc) FROM funcionario
WHERE sexo = 'M'

--Exemplo3: Exibir o maior salário pago a uma funcionária;

SELECT MAX(salario) FROM funcionario
WHERE sexo = 'F'

--Exemplo4: Exibir o menor preço de custo dos produtos do tipo 1.

SELECT MIN(custo) FROM produto
WHERE tipo = 1

--Exercício de fixação – Função de Agregação

--1. Exibir quantos clientes fizeram pedido na empresa.

SELECT COUNT(DISTINCT cliente) FROM pedido

--2. Exibir quantos clientes existem na cidade de código igual a 17.

SELECT COUNT(*) FROM cliente
WHERE cidade = '17'
--3. Exibir quantas cidades estrangeiras estão cadastradas.

SELECT COUNT(*) FROM cidade
WHERE pais != 'BRA'
--4. Exibir quantos funcionários têm e-mail.

SELECT COUNT(*) FROM funcionario
WHERE email IS NOT NULL
--5. Exibir a quantas cidades a empresa atende.

SELECT COUNT(DISTINCT cidade) FROM cliente

--6. Exibir a soma de todos os salários da empresa.

SELECT SUM(salario) FROM funcionario


--7. Exibir o total geral do preço de venda de todos os produtos. TG = quantidade X preço
--de venda.

SELECT SUM(quantest * venda) FROM produto

--8. Exibir a soma do valor do frete de todos os pedidos atendidos por via marítima.

SELECT SUM(frete) FROM pedido
WHERE via = 'M'

--9. Exibir a soma dos salários dos funcionários homens que não sejam vendedores
--(funções 10 e 11)

SELECT SUM(salario) AS SomaSalarioNaoVendedor FROM funcionario
WHERE sexo = 'M' AND funcao NOT IN (10,11)

--10. Exibir a média de idade das funcionárias dos setores ‘COV’ e ‘RHM’.

SELECT AVG(YEAR(getdate()) - YEAR(datanasc)) AS Idade FROM funcionario
WHERE sexo = 'F' AND setor IN ('COV', 'RHM')

--11. Exibir a média de salário das funcionárias com salário entre R$ 1.000,00 e R$
 --e R$ 2.000,00 que não sejam dos setores ‘PRS’ e ‘MKT’. 

SELECT  AVG(salario) from funcionario
WHERE sexo = 'F' AND salario BETWEEN $1000.00 AND $2000.00 AND setor NOT IN ('PRS', 'MKT')


--12. Exibir a média de salário dos vendedores (funções = 10 e 11) que não sejam casados.

SELECT AVG(salario) FROM funcionario
WHERE funcao NOT IN (10, 11)
--13. Exibir o preço médio de venda dos produtos do tipo 1.

SELECT AVG(venda) FROM produto
WHERE tipo = 1

--14. Exibir a data de nascimento da funcionária mais velha da empresa.

SELECT MIN(datanasc) FROM funcionario
WHERE sexo = 'F'

--15. Exibir quanto custou o produto mais caro da empresa.

SELECT MAX(custo) FROM produto
--16. Exibir a data do pedido mais recente.

SELECT MAX(datapedid) FROM pedido

--17. Exibir em que mês foi feito o pedido mais antigo atendido por via aérea.

SELECT MIN(MONTH(datapedid)) FROM pedido
WHERE via = 'A'