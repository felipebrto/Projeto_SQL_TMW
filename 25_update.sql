SELECT *
FROM relatorio_diario;
---update sem where: NÃO USAR!! SEMPRE COLOCAR WHERE
--UPDATE relatorio_diario
--SET qtdeTransacao = 100;

-----update com where:

UPDATE relatorio_diario
SET qtdTransacao = 10000             
WHERE dtDia >= '2025-08-25';

select *
from relatorio_diario;