--Criar um CONSTRAINT do tipo CHECK para impedir Lotes cuja Quantidade seja
--maior que 100. Mostrar o erro de violação do CONSTRAINT
ALTER TABLE Lotes
ADD CONSTRAINT CHK_Lotes_Quantidade_Max
CHECK (Quantidade <= 100);
—---------------------------------------------------------------
INSERT INTO Lotes(IdVacina, Quantidade, DataValidade)
VALUES (1, 150, ‘2025-05-01’);
