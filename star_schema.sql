CREATE DATABASE STARSCHEMA;

USE STARSCHEMA;

CREATE TABLE FORMACAO (
	ID_FORMACAO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	NIVEL VARCHAR(15)
);

CREATE TABLE FORMACAO_PROFESSOR (
	FK_FORMACAO INT,
	FK_PROFESSOR INT,
	DT_INICIO DATETIME,
        DT_FIM DATETIME
);

CREATE TABLE PROFESSOR (
	ID_PROFESSOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE PROFESSOR_DEPARTAMENTO (
	FK_PROFESSOR INT,
	FK_DEPARTAMENTO INT,
        DT_INICIO DATETIME,
        DT_FIM DATETIME
);

CREATE TABLE DEPARTAMENTO (
	ID_DEPARTAMENTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	CAMPUS VARCHAR(20)
);

CREATE TABLE CURSO (
	ID_CURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	FK_DEPARTAMENTO INT
);

CREATE TABLE CURSO_DISCIPLINA (
	FK_CURSO INT,
	FK_DISCIPLINA INT
);

CREATE TABLE DISCIPLINA (
	ID_DISCIPLINA INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE DISCIPLINA_PROFESSOR (
	FK_DISCIPLINA INT,
	FK_PROFESSOR INT,
        DT_INICIO DATETIME,
        DT_FIM DATETIME
);

ALTER TABLE FORMACAO_PROFESSOR
ADD CONSTRAINT PK_FORMACAO_PROFESSOR PRIMARY KEY CLUSTERED(FK_FORMACAO, FK_PROFESSOR);

ALTER TABLE PROFESSOR_DEPARTAMENTO
ADD CONSTRAINT PK_PROFESSOR_DEPARTAMENTO PRIMARY KEY CLUSTERED(FK_PROFESSOR, FK_DEPARTAMENTO);

ALTER TABLE CURSO_DISCIPLINA
ADD CONSTRAINT PK_CURSO_DISCIPLINA PRIMARY KEY CLUSTERED(FK_CURSO, FK_DISCIPLINA);

ALTER TABLE DISCIPLINA_PROFESSOR
ADD CONSTRAINT PK_DISCIPLINA_PROFESSOR PRIMARY KEY CLUSTERED(FK_DISCIPLINA, FK_PROFESSOR);

ALTER TABLE CURSO
ADD CONSTRAINT FK_CURSO_DEPARTAMENTO FOREIGN KEY(FK_DEPARTAMENTO)
REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO);

ALTER TABLE FORMACAO_PROFESSOR
ADD CONSTRAINT FK_PROFESSOR_FORMACAO_PROFESSOR FOREIGN KEY(FK_PROFESSOR)
REFERENCES PROFESSOR(ID_PROFESSOR);

ALTER TABLE FORMACAO_PROFESSOR
ADD CONSTRAINT FK_FORMACAO_FORMACAO_PROFESSOR FOREIGN KEY(FK_FORMACAO)
REFERENCES FORMACAO(ID_FORMACAO);

ALTER TABLE PROFESSOR_DEPARTAMENTO
ADD CONSTRAINT FK_PROFESSOR_PROFESSOR_DEPARTAMENTO FOREIGN KEY(FK_PROFESSOR)
REFERENCES PROFESSOR(ID_PROFESSOR);

ALTER TABLE PROFESSOR_DEPARTAMENTO
ADD CONSTRAINT FK_DEPARTAMENTO_PROFESSOR_DEPARTAMENTO FOREIGN KEY(FK_DEPARTAMENTO)
REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO);

ALTER TABLE CURSO_DISCIPLINA
ADD CONSTRAINT FK_CURSO_CURSO_DISCIPLINA FOREIGN KEY(FK_CURSO)
REFERENCES CURSO(ID_CURSO);

ALTER TABLE CURSO_DISCIPLINA
ADD CONSTRAINT FK_DISCIPLINA_CURSO_DISCIPLINA FOREIGN KEY(FK_DISCIPLINA)
REFERENCES DISCIPLINA(ID_DISCIPLINA);

ALTER TABLE DISCIPLINA_PROFESSOR
ADD CONSTRAINT FK_DISCIPLINA_DISCIPLINA_PROFESSOR FOREIGN KEY(FK_DISCIPLINA)
REFERENCES DISCIPLINA(ID_DISCIPLINA);

ALTER TABLE DISCIPLINA_PROFESSOR
ADD CONSTRAINT FK_PROFESSOR_DISCIPLINA_PROFESSOR FOREIGN KEY(FK_PROFESSOR)
REFERENCES PROFESSOR(ID_PROFESSOR);

