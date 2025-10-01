SELECT round(avg (QtdePontos),2) AS mediaCarteira,
       1.* sum(QtdePontos) / count(IdCliente) AS mediaCarteiraroots,
       min(QtdePontos) AS menorCarteira,
       max(QtdePontos) AS maiorCarteira,
       sum(FlTwitch) AS totalFlTwitch,
       sum(FlEmail) AS totalFlEmail

FROM clientes