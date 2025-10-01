---Qual categoria tem mais produtos vendidos?

SELECT t2.DescCateogriaProduto,
    count (t1.IdTransacao)
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

group by t2.DescCateogriaProduto
order by count (t1.IdTransacao) desc
LIMIT 10;
