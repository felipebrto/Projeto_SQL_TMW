--Quantidade de transações Acumuladas ao longo do tempo? 100MIL TRANSAÇÃO
WITH tb_diario AS (

SELECT substr(DtCriacao,1,10) AS dtDia,
       count(DISTINCT IdTransacao) AS qtdeTransacoes

FROM transacoes
GROUP BY dtDia
ORDER BY dtDia  

),

tb_acum AS (

SELECT *,
         sum(qtdeTransacoes) OVER ( ORDER BY dtDia) AS qtdeTransacaoAcum
FROM tb_diario

)

SELECT *
FROM tb_acum
WHERE qtdeTransacaoAcum > 100000
ORDER BY qtdeTransacaoAcum
LIMIT 1