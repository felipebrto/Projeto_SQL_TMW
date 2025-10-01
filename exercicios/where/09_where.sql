--- (FAZER NA LIVE 27/08) Listar todas as transações adicionando uma coluna nova sinalizando 
--- “alto”, “médio” e “baixo” para o valor dos pontos [<10 ; <500; >=500] 



SELECT IdTransacao, 
       QtdePontos,
        CASE
        WHEN QtdePontos < 10 THEN 'baixo'
        WHEN QtdePontos < 500 THEN 'médio'
        WHEN QtdePontos >= 500 THEN 'alto'
        END AS NIVEL
FROM transacoes;

