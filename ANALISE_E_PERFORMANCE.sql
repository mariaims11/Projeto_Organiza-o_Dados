-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: ANALISE_E_PERFORMANCE.sql
-- ============================================================

-- 1. RELATÓRIO DE PRODUTOS LÍDERES (JOIN + GROUP BY + HAVING)
SELECT
    p.titulo AS nome_produto,
    SUM(v.quantidade) AS total_vendido
FROM Vendas v
JOIN Produtos p ON v.produto_id = p.id
GROUP BY p.titulo
HAVING SUM(v.quantidade) > 10
ORDER BY total_vendido DESC;

-- 2. DIAGNÓSTICO DE EFICIÊNCIA (AUDITORIA DE PERFORMANCE)
EXPLAIN ANALYZE 
SELECT p.titulo, SUM(v.quantidade) 
FROM Vendas v JOIN Produtos p ON v.produto_id = p.id 
GROUP BY p.titulo;

-- 3. CONSULTA INTELIGÊNCIA ARTIFICIAL (ASK AI)
-- Total faturado em Euros por cada utilizador no sistema
SELECT 
    u.nome AS nome_utilizador,
    SUM(v.quantidade * p.preco) AS total_faturado_euros
FROM Vendas v
JOIN Utilizadores u ON v.utilizador_id = u.id
JOIN Produtos p ON v.produto_id = p.id
GROUP BY u.nome
ORDER BY total_faturado_euros DESC;
