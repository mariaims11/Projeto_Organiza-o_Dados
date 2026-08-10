-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- FICHEIRO: consultas.sql
-- ============================================================

-- 1. O COMANDO "VER TUDO" (Balanço Inicial)
-- Abre a gaveta Vendas e despeja tudo o que lá está
SELECT * FROM Vendas;

-- 2. O COMANDO "FILTRO INTELIGENTE" (Uso do WHERE)
-- Filtra e extrai apenas as vendas com quantidade superior a 1
SELECT id, utilizador_id, produto_id, quantity = quantidade
FROM Vendas
WHERE quantidade > 1;

-- 3. O "SUPER-JOIN" (O Relatório Profissional para o Diretor)
-- Junta as 3 gavetas para mostrar nomes e títulos em vez de números de ID
SELECT 
    Vendas.id AS venda_id, 
    Utilizadores.nome AS nome_cliente, 
    Produtos.titulo AS titulo_produto, 
    Vendas.quantidade
FROM Vendas
JOIN Utilizadores ON Vendas.utilizador_id = Utilizadores.id
JOIN Produtos ON Vendas.produto_id = Produtos.id;
