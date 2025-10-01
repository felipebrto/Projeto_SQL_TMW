---Lista de produtos que são “chapéu”;

SELECT IdProduto, DescProduto
FROM produtos
WHERE DescProduto LIKE '%chapéu%'
LIMIT 5;
