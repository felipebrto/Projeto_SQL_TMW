--10. Como foi a curva de Churn do Curso de SQL?
--identificando quantidade de clientes por dia
---fazendo valor de retencao( que ficaram até o dia 29) 
---clientes q participaram do primeiro dia ate ultimo
--pctChurn para entender é a diferenca da retenção (efeito contrario) pois 
--primeiro dia não teve churn e depois foi aumentando


-- SELECT
--        substr(DtCriacao,1,10) as dtDia,
--        count (DISTINCT IdCliente) as qtdeCliente

-- FROM transacoes

-- WHERE DtCriacao >= '2025-08-25'
-- AND DtCriacao < '2025-08-30'

-- GROUP BY 
WITH tb_clientes_d1 AS(
    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'
)

SELECT t1.IdCliente,
       substr(t2.DtCriacao, 1, 10) as dtDia,
       count (DISTINCT t1.IdCliente) AS qtdeCliente,
       1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientes_d1) AS pctRetencao,
       1 - (1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_clientes_d1)) AS pctChurn

FROM tb_clientes_d1 as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente  

WHERE t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'   

GROUP BY dtDia