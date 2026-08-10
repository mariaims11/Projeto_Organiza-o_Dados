-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: limpeza.sql
-- ============================================================

-- 1. REGRAS DE INTEGRIDADE (CONSTRAINTS)
ALTER TABLE Utilizadores
ADD CONSTRAINT email_valido CHECK (email LIKE '%@%.%');

ALTER TABLE Produtos
ADD CONSTRAINT preco_positivo CHECK (preco >= 0);

-- 2. PROCEDIMENTO DE CORREÇÃO (UPDATE)
UPDATE Utilizadores
SET email = 'novo.joao@email.com'
WHERE nome = 'João Silva';

-- 3. PROCEDIMENTO DE LIMPEZA (DELETE)
DELETE FROM Vendas
WHERE quantidade = 0;
