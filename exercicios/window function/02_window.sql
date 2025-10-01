--Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?

WITH tb_dia_cliente AS (

SELECT substr(DtCriacao,1,10) AS dtDia,
       count(DISTINCT IdCliente) AS qtdeClientes

FROM clientes
GROUP BY dtDia
ORDER BY dtDia

),

tb_acum AS (

SELECT *,
         sum(qtdeClientes) OVER ( ORDER BY dtDia) AS qtdeClientesAcum
FROM tb_dia_cliente 

)

SELECT *
FROM tb_acum
ORDER BY qtdeClientesAcum
