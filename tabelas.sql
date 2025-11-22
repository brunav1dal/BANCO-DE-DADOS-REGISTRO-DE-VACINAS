--CRIA BANCO DE DADOS--
CREATE TABLE Fabricantes (
    IdFabricante   INT IDENTITY(1,1)
        CONSTRAINT PK_Fabricantes PRIMARY KEY,
    NomeFabricante VARCHAR(100) NULL
);
GO

------------------------------------------------------------
-- PACIENTES
------------------------------------------------------------
CREATE TABLE Pacientes (
    IdPaciente     INT IDENTITY(1,1)
        CONSTRAINT PK_Pacientes PRIMARY KEY,
    Nome           VARCHAR(100) NOT NULL,
    DataNascimento DATE NULL
);
GO

------------------------------------------------------------
-- VACINADORES
------------------------------------------------------------
CREATE TABLE Vacinadores (
    IdVacinador   INT IDENTITY(1,1)
        CONSTRAINT PK_Vacinadores PRIMARY KEY,
    NomeVacinador VARCHAR(100) NOT NULL,
    Coren         VARCHAR(20)  NULL
);
GO

------------------------------------------------------------
-- VACINAS
------------------------------------------------------------
CREATE TABLE Vacinas (
    IdVacina     INT IDENTITY(1,1)
        CONSTRAINT PK_Vacinas PRIMARY KEY,
    NomeVacina   VARCHAR(100) NOT NULL,
    IdFabricante INT NOT NULL,
    CONSTRAINT FK_Vacinas_Fabricantes
        FOREIGN KEY (IdFabricante)
        REFERENCES Fabricantes(IdFabricante)
);
GO

------------------------------------------------------------
-- LOTES 
------------------------------------------------------------
CREATE TABLE Lotes (
    IdLote       INT IDENTITY(1,1)
        CONSTRAINT PK_Lotes PRIMARY KEY,
    IdVacina     INT NOT NULL,
    Quantidade   INT NOT NULL,
    DataValidade DATE NOT NULL,
    CONSTRAINT FK_Lotes_Vacinas
        FOREIGN KEY (IdVacina)
        REFERENCES Vacinas(IdVacina)
    -- se quiser manter o exercício do CHECK:
    -- ,CONSTRAINT CHK_Lotes_Quantidade_Max CHECK (Quantidade <= 100)
);
GO

------------------------------------------------------------
-- VACINACOES (registro da aplicação)
------------------------------------------------------------
CREATE TABLE Vacinacoes (
    IdVacinacao  INT IDENTITY(1,1)
        CONSTRAINT PK_Vacinacoes PRIMARY KEY,
    IdPaciente   INT NOT NULL,
    IdLote       INT NOT NULL,
    DataVacinacao DATETIME NULL,
    IdVacinador  INT NOT NULL,
    CONSTRAINT FK_Vacinacoes_Pacientes
        FOREIGN KEY (IdPaciente)
        REFERENCES Pacientes(IdPaciente),
    CONSTRAINT FK_Vacinacoes_Lotes
        FOREIGN KEY (IdLote)
        REFERENCES Lotes(IdLote),
    CONSTRAINT FK_Vacinacoes_Vacinadores
        FOREIGN KEY (IdVacinador)
        REFERENCES Vacinadores(IdVacinador)
);
GO
—----------------------------------------------------------------------
--2.1- Inserção de dados:
--------------------------
-- FABRICANTES
--------------------------
INSERT INTO Fabricantes (NomeFabricante) VALUES
('BioSaude'),
('ImunoTech'),
('VidaPlena'),
('HealthCore'),
('GlobalVax');
GO

--------------------------
-- VACINAS
--------------------------
INSERT INTO Vacinas (NomeVacina, IdFabricante) VALUES
('VaxCovid',        1),  -- BioSaude
('ImunoFlu',        2),  -- ImunoTech
('Hepatix',         3),  -- VidaPlena
('TriplaViralPlus', 4),  -- HealthCore
('GripeMax',        5);  -- GlobalVax
GO

--------------------------
-- PACIENTES
--------------------------
INSERT INTO Pacientes (Nome, DataNascimento) VALUES
('Ana Souza',     '1990-01-10'),
('Bruno Lima',    '1985-05-20'),
('Carlos Silva',  '1978-03-15'),
('Daniela Costa', '1995-09-08'),
('Eduardo Alves', '2000-12-01');
GO

--------------------------
-- LOTES
--------------------------
INSERT INTO Lotes (IdVacina, Quantidade, DataValidade) VALUES
(1, 50, '2025-01-01'),  -- VaxCovid
(2, 80, '2024-06-01'),  -- ImunoFlu 
(3, 60, '2025-02-10'),  -- Hepatix
(4, 70, '2023-12-31'),  -- TriplaViralPlus (
(5, 90, '2024-11-11');  -- GripeMax
GO

--------------------------
-- VACINAÇÕES
--------------------------
INSERT INTO Vacinacoes (IdPaciente, IdLote, DataVacinacao) VALUES
(1, 1, '2024-02-01T10:00:00', 1),
(1, 2, '2024-02-05T14:00:00', 2),
(1, 3, '2024-02-10T09:30:00', 3),
(1, 4, '2024-02-15T11:00:00', 4),
(1, 5, '2024-02-20T16:00:00', 5);

GO
