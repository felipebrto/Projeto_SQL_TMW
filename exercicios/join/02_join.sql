--2021 quantas transacos tivemos em lovers?
SELECT t3.DescCateogriaProduto,
       count(DISTINCT t1.IdTransacao)

FROM transacoes AS t1

LEFT JOIN transacao_produto as t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' 
AND t1.DtCriacao < '2025-01-01'
----AND t3.DescCateogriaProduto = 'lovers'


---AND t2.IdProduto IN ('1', '13') antes de fazer o segundo left

GROUP BY t3.DescCateogriaProduto
HAVING count(DISTINCT t1.IdTransacao) < 1000

ORDER BY count(DISTINCT t1.IdTransacao) DESC;