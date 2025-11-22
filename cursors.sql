--Declarar um cursor para gerar uma saída com Data, Pacientes, Lotes e Fabricantes.
DECLARE @DataVacinacao DATETIME,
        @NomePaciente  VARCHAR(100),
        @IdLote        INT,
        @NomeFabricante VARCHAR(100);

DECLARE cur_Vacinacoes CURSOR FOR
SELECT 
    V.DataVacinacao,
    P.Nome,
    L.IdLote,
    F.NomeFabricante
FROM Vacinacoes V
JOIN Pacientes P     ON V.IdPaciente = P.IdPaciente
JOIN Lotes L         ON V.IdLote     = L.IdLote
JOIN Vacinas VC      ON L.IdVacina   = VC.IdVacina
JOIN Fabricantes F   ON VC.IdFabricante = F.IdFabricante
ORDER BY V.IdVacinacao;

OPEN cur_Vacinacoes;

FETCH NEXT FROM cur_Vacinacoes INTO 
    @DataVacinacao,
    @NomePaciente,
    @IdLote,
    @NomeFabricante;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Data: ' + CONVERT(VARCHAR(20), @DataVacinacao, 120) +
          ' | Paciente: ' + @NomePaciente +
          ' | Lote: ' + CAST(@IdLote AS VARCHAR(10)) +
          ' | Fabricante: ' + @NomeFabricante;

    FETCH NEXT FROM cur_Vacinacoes INTO 
        @DataVacinacao,
        @NomePaciente,
        @IdLote,
        @NomeFabricante;
END

CLOSE cur_Vacinacoes;
DEALLOCATE cur_Vacinacoes;

--Listar os Vacinadores que tomaram vacina, mostrando o tipo, o fabricante e a data de validade da vacina


DECLARE @NomeVacinador   VARCHAR(100),
        @TipoVacina      VARCHAR(100),
        @NomeFabricante  VARCHAR(100),
        @DataValidade    DATE;

DECLARE cur_Vacinadores CURSOR FOR
SELECT DISTINCT
    Vd.NomeVacinador,
    Vac.NomeVacina     AS TipoVacina,
    F.NomeFabricante,
    L.DataValidade
FROM Vacinacoes VC
JOIN Vacinadores Vd  ON VC.IdVacinador = Vd.IdVacinador
JOIN Lotes L         ON VC.IdLote      = L.IdLote
JOIN Vacinas Vac     ON L.IdVacina     = Vac.IdVacina
JOIN Fabricantes F    ON Vac.IdFabricante = F.IdFabricante
ORDER BY Vd.NomeVacinador, Vac.NomeVacina;

OPEN cur_Vacinadores;

FETCH NEXT FROM cur_Vacinadores INTO
    @NomeVacinador,
    @TipoVacina,
    @NomeFabricante,
    @DataValidade;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Vacinador: ' + @NomeVacinador +
          ' | Tipo de Vacina: ' + @TipoVacina +
          ' | Fabricante: ' + @NomeFabricante +
          ' | Validade: ' + CONVERT(VARCHAR(10), @DataValidade, 120);

    FETCH NEXT FROM cur_Vacinadores INTO
        @NomeVacinador,
        @TipoVacina,
        @NomeFabricante,
        @DataValidade;
END

CLOSE cur_Vacinadores;
DEALLOCATE cur_Vacinadores;
GO
