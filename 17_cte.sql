--CTE: COMMON TABLE EXPRESSION

--SELECT count (distinct IdCliente) 
--FROM transacoes AS t1
--WHERE t1.IdCliente IN (
--SELECT distinct IdCliente
       -- transacoes
       --WHERE substr(DtCriacao,1,10) = '2025-08-25'
--)
--AND substr(t1.DtCriacao,1,10) = '2025-08-29';


--Exemplo abaixo foi criado tabela de primeiro dia e ultimo dia e depois
---cruzou com leftjoin para saber se o cliente estava no primeiro e utlimo 

--cte começa com with e cria tabelas e depois cruza os dois, 
--mais bacana que subquery
WITH tb_cliente_primeiro_dia AS (

SELECT DISTINCT IdCliente   
FROM transacoes
WHERE substr(DtCriacao,1,10) = '2025-08-25'
),


tb_cliente_ultimo_dia AS (

SELECT DISTINCT IdCliente
FROM transacoes
WHERE substr(DtCriacao,1,10) = '2025-08-29'
),

tb_join AS (
    SELECT t1.IdCliente AS PrimCliente,
        t2.IdCliente AS UltCliente

    FROM tb_cliente_primeiro_dia as t1

    LEFT JOIN tb_cliente_ultimo_dia as t2 

    ON t1.IdCliente = t2.IdCliente
)

select count (PrimCliente), --quantos clientes no primeiro
       count (UltCliente), --quantos no ultimo
       1. *count(UltCliente) / count (PrimCliente) --proporção
from tb_join