--6 - Views; Criar uma VIEW de todos os Lotes com data vencida.
CREATE VIEW vwLotesVencidos AS
SELECT 
    L.IdLote,
    L.IdVacina,
    L.Quantidade,
    L.DataValidade
FROM Lotes L
WHERE L.DataValidade < GETDATE();

SELECT * FROM vwLotesVencidos;
