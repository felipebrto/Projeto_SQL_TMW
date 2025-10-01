--Quantos produtos são de rpg?
SELECT COUNT(*) AS TotalProdutosRPG
FROM produtos
WHERE DescCateogriaProduto = 'rpg';

--outra opcao ver quanto tem para cada produto

SELECT DescCateogriaProduto,
       COUNT(*)
FROM produtos

GROUP BY DescCateogriaProduto;



