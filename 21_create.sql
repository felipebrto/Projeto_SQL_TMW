---drop table [nome da table] - para excluir tabela
---create table [nome da table] - para criar tabela

---opcao abaixo é para apagar e cria tabela quando for tabela para diversos user
---evita ficar imputando mesma tabela no banco
--drop table if exists [nome da table] - para excluir tabela se existir 
---create table if not exists [nome da table] as - para criar tabela se não existir


CREATE TABLE relatorio_diario AS 

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
FROM tb_acum;




