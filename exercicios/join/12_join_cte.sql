--12. Dentre os clientes de janeiro/2025, quantos assistiram o curso de SQL?

--PRIMEIRO MODELO: mais complexo deste jeito::

WITH tb_clientes_janeiro AS (
    SELECT DISTINCT IdCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
)

SELECT count(DISTINCT t1.IdCliente),
       count(DISTINCT t2.IdCliente)

FROM tb_clientes_janeiro as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente
AND t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'
;

---segundo modelo cte: criando duas tabelas e cruzando:::

WITH tb_clientes_janeiro AS (
SELECT DISTINCT IdCliente
FROM transacoes
WHERE DtCriacao >= '2025-01-01'
AND DtCriacao < '2025-02-01'
),

tb_clientes_curso AS (
SELECT DISTINCT IdCliente
FROM transacoes
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
)

SELECT
    count(DISTINCT t1.IdCliente) as clienteJaneiro,
    count(DISTINCT t2.IdCliente) as clienteCurso

FROM tb_clientes_janeiro as t1

LEFT JOIN tb_clientes_curso as t2
ON t1.IdCliente = t2.IdCliente
;
