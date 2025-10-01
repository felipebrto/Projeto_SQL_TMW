---INTERVALOS
-- A 500 -> PONEI
--501A 1000-> PONEI PREMIUM
-- 1001 A 5000 -> MAGO APRENDIZ
-- 5001 A 10000 > MAGOM MESTRE
--+ 10001-> MAGO SUPREMO

--2FORMAS DE FAZER: 

SELECT IdCliente,
       QtdePontos,
       CASE 
          WHEN QtdePontos <= 500 THEN 'PONEI'
          WHEN QtdePontos > 500 AND QtdePontos <= 1000 THEN 'PONEI PREMIUM'
          WHEN QtdePontos > 1000 AND QtdePontos <= 5000 THEN 'MAGO APRENDIZ'
          WHEN QtdePontos > 5000 AND QtdePontos <= 10000 THEN 'MAGO MESTRE'
          ELSE 'MAGO SUPREMO'
       END AS Categoria
FROM clientes
ORDER BY QtdePontos DESC;

--OU FAZER DESTE FORMA:POIS JA FOI ATRIBUIDO VALOR PARA MENOR IGUAL AO VALOR ANTERIOR

SELECT IdCliente,
       QtdePontos,
       CASE 
          WHEN QtdePontos <= 500 THEN 'PONEI'
          WHEN QtdePontos <= 1000 THEN 'PONEI PREMIUM'
          WHEN QtdePontos <= 5000 THEN 'MAGO APRENDIZ'
          WHEN QtdePontos <= 10000 THEN 'MAGO MESTRE'
          ELSE 'MAGO SUPREMO'
       END AS Categoria
       
FROM clientes
ORDER BY QtdePontos DESC;

--- criando mais uma coluna de case na mesma query

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

