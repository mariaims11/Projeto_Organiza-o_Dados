-- 1. Criar a Tabela de Utilizadores
CREATE TABLE Utilizadores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_registo TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Criar a Tabela de Produtos
CREATE TABLE Produtos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

-- Inserir dados de teste em Utilizadores
INSERT INTO Utilizadores (nome, email) VALUES 
('Ana Silva', 'ana.silva@email.com'),
('Carlos Santos', 'carlos.santos@email.com');

-- Inserir dados de teste em Produtos
INSERT INTO Produtos (titulo, preco, stock) VALUES 
('Livro de Bases de Dados SQL', 29.90, 50),
('Curso Completo de PostgreSQL', 99.00, 10);

-- Consultar a tabela para a evidência
SELECT * FROM Utilizadores;
