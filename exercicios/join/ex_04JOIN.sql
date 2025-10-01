--Clientes mais antigos, tem mais frequência de transação?
SELECT t1.IdCliente,
       --julianday(substr(DtCriacao, 1, 19)),
       --julianday('now'),
       julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) as idadeBase,
       -- ou 
       --versão numeros inteiros: 
       --CAST(julianday('now') - julianday(substr(t1.DtCriacao, 1, 19)) as INTEGER) as idadeBase,
       count(t2.IdTransacao) as qtdeTransacoes

FROM clientes as t1

LEFT JOIN transacoes as t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente, idadeBase