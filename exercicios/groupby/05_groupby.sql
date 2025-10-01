--Qual o valor médio de pontos positivos por dia?
---opcao teomewhy

SELECT sum(QtdePontos) as totalPontos,
      count(DISTINCT substr(DtCriacao,1,10)) as Diasunicos,
      sum(QtdePontos) / count(DISTINCT substr(DtCriacao,1,10)) as mediaPontosPorDia
    
FROM transacoes

WHERE QtdePontos > 0;