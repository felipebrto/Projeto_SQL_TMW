-- Saldo de pontos acumulado de cada usuário

---saberemos saldo da carteira do cliente por dia e saldo acumulado

---pontos positivos e negativos que gastaram ou ganharam

WITH tb_cliente_dia AS (

    SELECT IdCliente,
        substr(DtCriacao, 1, 10) AS dtDia,
        SUM(QtdePontos) AS TotalPontos,
        SUM (CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS pontosPos,
        SUM (CASE WHEN QtdePontos < 0 THEN QtdePontos ELSE 0 END) AS pontosNeg
    FROM transacoes
    GROUP BY IdCliente, dtDia

)

SELECT *,
       SUM(TotalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS SaldoAcumulado
FROM tb_cliente_dia
