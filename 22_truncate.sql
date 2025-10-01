---sqlite não tem truncate mas serve para limpar a tabela e deixar a tabela existir
--- TRUNCATE (USADO EM OUTROS SISTEMAS) = DELETE (SQLITE)


DELETE FROM relatorio_diario; --DELETAR DADOS DA TABELA

SELECT * FROM relatorio_diario; --VISUALIZAR TABELA SEM 

.schema relatorio_diario;
