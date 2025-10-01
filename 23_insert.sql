-- INSERT INTO relatorio_diario --- tem q ser adicionado depois dos dados da tabela
--se fizer insert mais de uma vez vai duplicar os dados
---podemos colocar o delete from no começo da query para não ter duplicidade
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

INSERT INTO relatorio_diario --- tem q ser depois dos dados da tabela

SELECT *
FROM tb_acum;

SELECT *

FROM relatorio_diario;
