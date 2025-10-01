SELECT *
FROM transacao_produto --tabela 1
LEFT JOIN produtos  --tabela 2
ON transacao_produto.IdProduto = produtos.IdProduto --idproduto tem na tabela 1 e 2
LIMIT 10;

SELECT *
FROM transacao_produto --tabela 1
INNER JOIN produtos  --tabela 2
ON transacao_produto.IdProduto = produtos.IdProduto --idproduto tem na tabela 1 e 2
LIMIT 10;

--PODEMOS APELIDAR AS TABELAS PARA FICAR MAIS FACIL JOIN t1 e t2


SELECT *
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2 --tabela 2
ON t1.IdProduto = t2.IdProduto --idproduto tem na tabela 1 e 2
LIMIT 10;

--- como trazer apenas uma coluna da tabela 2

SELECT t1.*,
    t2.DescProduto
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2 --tabela 2
ON t1.IdProduto = t2.IdProduto --idproduto tem na tabela 1 e 2
LIMIT 10;