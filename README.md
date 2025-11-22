# Sistema Completo de Gerenciamento de Vacinação — Modelo Relacional + SQL Avançado
Este projeto implementa um sistema completo de controle de vacinação, usando modelagem relacional, normalização, SQL conceitual e SQL Server. Inclui banco de dados normalizado (3FN), consultas complexas, stored procedures, triggers, tabelas temporais, views, cursores e operações de controle de integridade.
O objetivo é demonstrar domínio de SQL para aplicações práticas e acadêmicas.

**-DIAGRAMA RELACIONAL**
* Fabricantes (1) — (N) Vacinas
* Vacinas.IdFabricante → FK para Fabricantes.IdFabricante
* Vacinas (1) — (N) Lotes
* Lotes.IdVacina → FK para Vacinas.IdVacina
* Lotes (1) — (N) Vacinacoes
* Vacinacoes.IdLote → FK para Lotes.IdLote
* Pacientes (1) — (N) Vacinacoes
* Vacinacoes.IdPaciente → FK para Pacientes.IdPaciente
* Vacinadores (1) — (N) Vacinacoes
* Vacinacoes.IdVacinador → FK para Vacinadores.IdVacinador



**-TECNOLOGIAS UTILIZADAS:**
* SQL SERVER 2022
* SQL RELACIONAL
* DDL/DML/DQL
* Stored Procedures
* Triggrers
* Tabelas Temporais
* Cursores
* Constrains
* Full Joins, Unions, Subqueries, NOT EXISTS
