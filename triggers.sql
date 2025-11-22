--Fazer um trigger que atualize a data de Vacinação toda vez que houver uma inclusão de Vacinação
CREATE TRIGGER trg_AtualizaDataVacinacao
ON Vacinacoes
AFTER INSERT
AS
BEGIN
    UPDATE V
    SET DataVacinacao = SYSDATETIME()
    FROM Vacinacoes V
    INNER JOIN inserted I
        ON V.IdVacinacao = I.IdVacinacao;
END;
GO
—-----------------------------------------------------------------------------------
INSERT INTO Vacinacoes (IdPaciente, IdLote, IdVacinador)
VALUES (1, 1, 2);
—-----------------------------------------------------------------------------------

SELECT * FROM Vacinacoes ORDER BY IdVacinacao DESC;
