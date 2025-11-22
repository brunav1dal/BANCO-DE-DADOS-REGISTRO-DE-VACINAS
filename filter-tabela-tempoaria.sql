--Crie uma Tabela temporal, alimente dados em tempos diferentes e faça uma consulta que filtre os dados de certo intervalo de tempo.

DROP TABLE IF EXISTS PacientesTemporalHistory;
DROP TABLE IF EXISTS PacientesTemporal;
GO

CREATE TABLE PacientesTemporal (
    IdPaciente INT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE,
    StatusPaciente VARCHAR(30),

    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime   DATETIME2 GENERATED ALWAYS AS ROW END   NOT NULL,
    PERIOD FOR SYSTEM_TIME (SysStartTime, SysEndTime)
)
WITH (
    SYSTEM_VERSIONING = ON (
        HISTORY_TABLE = dbo.PacientesTemporalHistory
    )
);
GO

--Para demonstrar a aplicação prática de uma tabela temporal, utilizei o campo StatusPaciente para representar a evolução de um paciente no processo de vacinação.
--O status inicia em “Pré-cadastro”, indicando que o paciente ainda não teve seus dados validados.
--Após confirmação de documentos e requisitos, passa para “Apto para vacinação”.
--Quando recebe a primeira dose, o status muda para “Vacinado 1ª dose”.
--Finalmente, ao completar todas as doses necessárias, o status é alterado para “Esquema completo”.
--Cada uma dessas atualizações gera automaticamente uma nova versão histórica na tabela de histórico (PacientesTemporalHistory).
--Dessa forma, é possível consultar exatamente em que momento cada etapa do processo ocorreu, utilizando FOR SYSTEM_TIME.
