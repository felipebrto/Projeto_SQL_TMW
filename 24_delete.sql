--usando delete para excluir com condição, no caso retirar os domingos

DELETE FROM relatorio_diario
WHERE strftime ('%w', substr(dtDia,1,10)) = '0';   

SELECT * FROM relatorio_diario;

DELETE FROM relatorio_diario; --DELETAR DADOS DA TABELA