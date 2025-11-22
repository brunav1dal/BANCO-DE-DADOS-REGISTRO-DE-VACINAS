--Criar um STORAGE PROCEDURE que mostre os Pacientes que tomaram Vacina Vencida, com o nome do Fabricante e o código do Lote.
CREATE PROCEDURE usp_PacientesVacinaVencida
AS
BEGIN
    SELECT DISTINCT
        P.IdPaciente,
        P.Nome              AS NomePaciente,
        F.NomeFabricante,
        V.NomeVacina,
        L.IdLote            AS CodigoLote,      
        L.DataValidade,
        Vac.DataVacinacao
    FROM Vacinacoes Vac
    JOIN Pacientes   P ON Vac.IdPaciente = P.IdPaciente
    JOIN Lotes       L ON Vac.IdLote     = L.IdLote
    JOIN Vacinas     V ON L.IdVacina     = V.IdVacina
    JOIN Fabricantes F ON V.IdFabricante = F.IdFabricante
    WHERE L.DataValidade < Vac.DataVacinacao;  -- vacina aplicada vencida
END;
GO

