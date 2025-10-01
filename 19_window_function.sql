WITH tb_cliente_dia AS (

SELECT IdCliente,
        substr(DtCriacao, 1, 10) as dtDia,
        count(distinct IdTransacao) as qtdeTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25' 
    AND DtCriacao < '2025-08-30'

    GROUP BY IdCliente, dtDia

),


tb_lag AS (

SELECT *,
       sum(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) as qtdeTransacao,
       lag(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) as lagTransacao
FROM tb_cliente_dia

)

SELECT *,
       1.* qtdeTransacao / lagTransacao


FROM tb_lag