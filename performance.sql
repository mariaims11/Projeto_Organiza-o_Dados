-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: performance.sql
-- ============================================================

-- 1. CRIAÇÃO DE ÍNDICE (DIFERENCIAL DE PERFORMANCE)
CREATE INDEX idx_utilizador_nome ON Utilizadores(nome);

-- 2. RAIO-X DO PLANO DE EXECUÇÃO
EXPLAIN SELECT * FROM Utilizadores WHERE nome = 'João Silva';
