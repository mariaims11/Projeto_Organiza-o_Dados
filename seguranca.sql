-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: seguranca.sql
-- ============================================================

-- 1. CRIAÇÃO DE ROLES
CREATE ROLE leitor_organizacao;
CREATE ROLE editor_organizacao;

-- 2. ATRIBUIÇÃO DE PRIVILÉGIOS (RBAC)
GRANT SELECT ON Utilizadores TO leitor_organizacao;
GRANT SELECT ON Vendas TO leitor_organizacao;
GRANT SELECT, INSERT, UPDATE ON Produtos TO editor_organizacao;

-- 3. COMANDOS DE TESTE E VALIDAÇÃO
-- Teste de Bloqueio (Esperado: Permission Denied)
-- SET ROLE leitor_organizacao; DELETE FROM Vendas WHERE id = 1;
-- RESET ROLE;

-- Teste de Sucesso (Esperado: UPDATE realizado)
-- SET ROLE editor_organizacao; UPDATE Produtos SET preco = 22.50 WHERE id = 1;
-- RESET ROLE;
