--Qual o produto mais transacionado? 

SELECT IdProduto, Count(*) as TotalTransacao
FROM transacao_produto
GROUP BY IdProduto
ORDER BY count(*) DESC
--ORDER BY TotalTransacao DESC