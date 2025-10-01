--SELECT IdProduto,count(*)

--FROM transacao_produto

--Group BY IdProduto

---saber cliente que mais juntou ponto

SELECT IdCliente, 
       SUM(QtdePontos) AS TotalPontos,
       count(IdTransacao) AS TotalTransacoes
FROM transacoes
where DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
Group By IdCliente
HAVING sum(QtdePontos) >= 4000
order by TotalPontos DESC