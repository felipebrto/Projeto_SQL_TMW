--  Quais clientes mais perderam pontos por Lover?
SELECT t1.IdCliente, 
       --t1.IdTransacao,
       sum(t1.QtdePontos) as totalPontos
       --t2.IdProduto,
       --t3.DescProduto,
       --t3.DescCateogriaProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto as t2
On t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCateogriaProduto = 'lovers'

GROUP BY t1.IdCliente
ORDER BY totalPontos ASC
LIMIT 10;
