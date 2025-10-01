---(FAZER NA LIVE 27/08) Lista de pedidos realizados no fim de semana
--Lista de transações com apenas 1 ponto;
SELECT IdTransacao, QtdePontos
FROM transacoes
WHERE QtdePontos = 1
LIMIT 5;







