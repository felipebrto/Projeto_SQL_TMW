--Selecione produtos que contêm ‘churn’ no nome
SELECT *
from produtos
WHERE DescCateogriaProduto LIKE '%Churn%';


---segunda opção

SELECT *
FROM produtos
WHERE DescProduto = 'Churn_10pp'
OR DescProduto = 'Churn_2pp'
OR DescProduto = 'Churn_5pp';

--terceira opção

SELECT *
FROM produtos
WHERE DescProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp');