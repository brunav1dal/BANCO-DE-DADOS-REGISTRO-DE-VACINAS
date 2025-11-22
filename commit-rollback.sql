--script contendo uma situação de atualização e COMMIT mostrando a persistência dos dados e outro contendo uma situação de ROLLBACK mostrando que as atualizações foram desfeitas
SELECT * FROM Lotes WHERE IdLote = 2;
BEGIN TRANSACTION;

    UPDATE Lotes
    SET Quantidade = Quantidade - 30
    WHERE IdLote = 2;

-- Verificando dentro da transação (alterações TEMPORÁRIAS)
SELECT * FROM Lotes WHERE IdLote = 2;
ROLLBACK;
-- Depois do ROLLBACK (alteração desfeita)
SELECT * FROM Lotes WHERE IdLote = 2;
--
SELECT * FROM Lotes WHERE IdLote = 1;


BEGIN TRANSACTION;

    UPDATE Lotes
    SET Quantidade = Quantidade + 10
    WHERE IdLote = 1;

-- Conferindo dentro da transação (não está confirmado ainda)
SELECT * FROM Lotes WHERE IdLote = 1;

COMMIT;

-- Depois do COMMIT (a alteração persiste)
SELECT * FROM Lotes WHERE IdLote = 1;
