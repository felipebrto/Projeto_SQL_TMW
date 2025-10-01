---de quanto em quanto tempo vem ver 

---calculamos quantas vezes vieram cada cliente

--calculamos a media geral e media por clientes que vieram em 2025 ver o canal


WITH cliente_dia AS (           
    SELECT 
        DISTINCT
        IdCliente,
        substr(DtCriacao, 1, 10) as dtDia
    FROM transacoes
    WHERE substr(DtCriacao, 1, 4) = '2025'

    ORDER BY IdCliente, dtDia

),

tb_lag AS (

SELECT *,
      lag(dtDia) over (partition by IdCliente order by dtDia) as lagDia
FROM cliente_dia    

),

tb_diff_dt AS (

SELECT *,
       julianday (dtDia) - julianday (lagDia) as DtDiff

FROM tb_lag

),

avg_cliente AS (

SELECT IdCliente, avg(DtDiff) as avgDia 
FROM tb_diff_dt
GROUP BY IdCliente

)

SELECT avg(avgDia) as avg_cliente
FROM avg_cliente
