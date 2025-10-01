---9. Dos clientes que começaram SQL no primeiro dia, quantos chegaram ao 5o dia?
--calculando quantos entraram dia 25 mas não participaram do dia 29
--subquery no where in

SELECT count (distinct IdCliente) 
FROM transacoes AS t1
WHERE t1.IdCliente IN (
       SELECT distinct IdCliente
       FROM transacoes
       WHERE substr(DtCriacao,1,10) = '2025-08-25'
)
AND substr(t1.DtCriacao,1,10) = '2025-08-29'
;
--- calculando quantos entraram dia 25
       SELECT count (distinct IdCliente)
       FROM transacoes
       WHERE substr(DtCriacao,1,10) = '2025-08-25'
;


--ou seja mais de 240 pessoas não participaram da live dia 29 5dia de curso