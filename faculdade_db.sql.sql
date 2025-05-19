-- Criação do Banco de Dados
CREATE DATABASE faculdade_db;
USE faculdade_db;

-- Tabela Curso
CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao_semestres INT,
    carga_horaria_total INT
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

-- Tabela Professor
CREATE TABLE Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    especializacao VARCHAR(100)
);

-- Tabela Turma
CREATE TABLE Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    disciplina_id INT,
    professor_id INT,
    horario VARCHAR(50),
    sala VARCHAR(20),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id),
    FOREIGN KEY (professor_id) REFERENCES Professor(id)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nasc DATE,
    endereco VARCHAR(200)
);

-- Tabela Matricula (Relacionamento Aluno-Turma)
CREATE TABLE Matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    turma_id INT,
    data_matricula DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
);

-- Tabela Nota
CREATE TABLE Nota (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT,
    nota_1 DECIMAL(4,2),
    nota_2 DECIMAL(4,2),
    nota_3 DECIMAL(4,2),
    media DECIMAL(4,2),
    status VARCHAR(20),
    FOREIGN KEY (matricula_id) REFERENCES Matricula(id)
);