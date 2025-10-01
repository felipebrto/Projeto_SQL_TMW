--Qual o produto com mais pontos transacionado?
SELECT IdProduto,
       sum(VlProduto) as TotalVendido,
       sum(QtdeProduto) as qtdevenda
FROM transacao_produto
GROUP BY IdProduto
ORDER BY sum(VlProduto) DESC