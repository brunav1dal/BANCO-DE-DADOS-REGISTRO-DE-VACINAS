--Fazer a união dos Lotes com vencimento em 30 dias com as vencidas há 30 dias.

INSERT INTO Lotes (IdVacina, Quantidade, DataValidade)
VALUES (1, 40, DATEADD(DAY, 30, CAST(GETDATE() AS DATE)));
GO

INSERT INTO Lotes (IdVacina, Quantidade, DataValidade)
VALUES (2, 40, DATEADD(DAY, -30, CAST(GETDATE() AS DATE)));
-----------nesse caso na minha tabela original não havia dados que mostravam essa mensagem, pois todos os lotes estavam na validade.Para mostrar a mensagem, adicionei dois dados que mostrem esse aviso.----------

SELECT 
    L.IdLote,
    L.IdVacina,
    L.Quantidade,
    L.DataValidade,
    'Vence nos próximos 30 dias' AS StatusLote
FROM Lotes L
WHERE L.DataValidade BETWEEN CAST(GETDATE() AS DATE)
                          AND DATEADD(DAY, 30, CAST(GETDATE() AS DATE))

UNION

SELECT 
    L.IdLote,
    L.IdVacina,
    L.Quantidade,
    L.DataValidade,
    'Venceu nos últimos 30 dias' AS StatusLote
FROM Lotes L
WHERE L.DataValidade BETWEEN DATEADD(DAY, -30, CAST(GETDATE() AS DATE))
                          AND CAST(GETDATE() AS DATE);


