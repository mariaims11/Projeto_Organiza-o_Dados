-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- FICHEIRO: setup_completo.sql
-- VERSÃO: v1.0 (Instalação Automática)
-- ============================================================

-- 1. SEÇÃO DE LIMPEZA TOTAL (Ordem correta devido às Foreign Keys)
DROP TABLE IF EXISTS Vendas CASCADE;
DROP TABLE IF EXISTS Produtos CASCADE;
DROP TABLE IF EXISTS Utilizadores CASCADE;

-- 2. SEÇÃO DE CRIAÇÃO DA ESTRUTURA (Ordem obrigatória)
-- Tabelas base primeiro
CREATE TABLE Utilizadores (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Produtos (
    id SERIAL PRIMARY KEY, 
    titulo VARCHAR(200) NOT NULL, 
    preco DECIMAL(10, 2) NOT NULL, 
    stock INT NOT NULL
);

-- Tabela dependente por último
CREATE TABLE Vendas (
    id SERIAL PRIMARY KEY, 
    utilizador_id INT REFERENCES Utilizadores(id), 
    produto_id INT REFERENCES Produtos(id), 
    quantidade INT NOT NULL
);

-- 3. SEÇÃO DE ACELERAÇÃO (Otimização e Performance)
CREATE INDEX idx_utilizador_nome ON Utilizadores(nome);

-- 4. SEÇÃO DE SEGURANÇA (Controlo de Níveis de Acesso)
-- Nota: Limpeza prévia da Role para permitir reexecução limpa do script
DROP ROLE IF EXISTS estagiario_leitor;
CREATE ROLE estagiario_leitor;
GRANT SELECT ON Utilizadores TO estagiario_leitor;
