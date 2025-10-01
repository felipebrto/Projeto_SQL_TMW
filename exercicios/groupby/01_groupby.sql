--Quantos clientes tem email cadastrado?

SELECT sum(FlEmail)
FROM clientes;



--outra opcao:
SELECT FlEmail, COUNT(IdCliente) AS TotalcomEmail
FROM clientes
WHERE FlEmail = 1
GROUP BY FlEmail;
