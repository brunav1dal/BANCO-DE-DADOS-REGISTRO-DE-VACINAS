--Criar uma Tabela Temporária Global com os dados da Tabela de Fabricantes

—------------------------------------------------  criação tabela temp. global—----------------------------
SELECT *
INTO ##FabricantesGlobal
FROM Fabricantes;
—------------------------------------------------------------------------
visualização da tabela temp.
—------------------------------------------------------------------------
SELECT * FROM ##FabricantesGlobal;
