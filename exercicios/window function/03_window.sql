--Qual o dia da semana mais ativo de cada usuário?

---rownumber para saber os maiores dias de transacao por 

---RESULTADO SABEREMOS O DIA QUE PODEMOS COMUNICAR OS CLIENTES
--QUE ESTÃO ATIVOS NA SEGUNDA, TERÇA

WITH tb_cliente_semana AS (

    SELECT IdCliente,
        count (DISTINCT IdTransacao) AS qtdeTransacoes,
        strftime('%w', substr(DtCriacao,1,10)) AS DiaSemana

    FROM transacoes
    GROUP BY IdCliente, DiaSemana   

),

tb_rn AS (

    SELECT *,
        CASE 
            WHEN DiaSemana = '0' THEN 'Domingo'
            WHEN DiaSemana = '1' THEN 'Segunda'
            WHEN DiaSemana = '2' THEN 'Terça'
            WHEN DiaSemana = '3' THEN 'Quarta'
            WHEN DiaSemana = '4' THEN 'Quinta'
            WHEN DiaSemana = '5' THEN 'Sexta'
            WHEN DiaSemana = '6' THEN 'Sábado'
        END AS NomeDiaSemana,
        ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdeTransacoes DESC) AS rn
    FROM tb_cliente_semana

)

SELECT *
FROM tb_rn
WHERE rn = 1