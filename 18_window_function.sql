WITH tb_sumario_dias AS (

SELECT substr(DtCriacao, 1,10) as dtDia,
       count(DISTINCT IdTransacao) as qtdeTransacoes

FROM transacoes

WHERE DtCriacao >= '2025-08-25' 
AND DtCriacao < '2025-08-30'

GROUP BY dtDia

)

SELECT *,
       sum(qtdeTransacoes) OVER (PARTITION BY 1 ORDER BY dtDia) as qtdeTransacaoAcum

from tb_sumario_dias