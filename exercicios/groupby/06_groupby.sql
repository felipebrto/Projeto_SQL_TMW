--Qual dia da semana quem mais pedidos em 2025?


SELECT 
       strftime('%w', substr(DtCriacao, 1, 10)) AS diaSemana,
       count (IdTransacao) As QtdeTransacao,
       count (DISTINCT IdTransacao) As QtdeTransacao2,
       count (*) AS QtdeTransacao3
FROM transacoes
WHERE substr(DtCriacao,1,4) = '2025'
GROUP BY 1;

