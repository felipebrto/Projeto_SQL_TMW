----- criando mais uma coluna de case na mesma query

SELECT IdCliente,
       QtdePontos,
       CASE 
          WHEN QtdePontos <= 500 THEN 'PONEI'
          WHEN QtdePontos <= 1000 THEN 'PONEI PREMIUM'
          WHEN QtdePontos <= 5000 THEN 'MAGO APRENDIZ'
          WHEN QtdePontos <= 10000 THEN 'MAGO MESTRE'
          ELSE 'MAGO SUPREMO'
       END AS Categoria,

       CASE
          WHEN QtdePontos <= 1000 THEN 1
          ELSE 0
       END AS flPonei,

       CASE
           WHEN QtdePontos > 1000 THEN 1
           ELSE 0
       END AS flMago
FROM clientes
ORDER BY QtdePontos DESC;