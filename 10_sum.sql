--SELECT sum(QtdePontos) AS TotalPontos
--FROM transacoes
--WHERE DtCriacao >= '2025-07-01'
--AND DtCriacao < '2025-08-01'
--AND QtdePontos > 0 --traz o valor positivo sem saida de pontos

--outra forma

SELECT IdTransacao,
       sum(QtdePontos),
       sum(CASE
           WHEN QtdePontos > 0 THEN QtdePontos
       END) AS qtdePontosPositivos,
       sum(CASE
           WHEN QtdePontos < 0 THEN QtdePontos
       END) AS qtdePontosNegativos,
       count(CASE
            WHEN QtdePontos <0 THEN QtdePontos
            END) AS qtdeTransacoesNegativas

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'