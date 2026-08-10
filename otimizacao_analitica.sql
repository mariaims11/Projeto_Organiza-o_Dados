-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: otimizacao_analitica.sql
-- ============================================================

-- 1. ESTRUTURA DE ALTA ESCALABILIDADE (INDEXAÇÃO PARCIAL)
-- Indexa apenas faturas de alta rotação para poupar espaço em disco e memória RAM
CREATE INDEX idx_vendas_data_recente
ON Vendas (quantidade)
WHERE quantidade >= 10;

-- 2. EXTRATO ANALÍTICO (BASE PARA EXPORTAÇÃO CSV / POWER BI)
SELECT 
    v.id AS transacao_id, 
    u.nome AS cliente, 
    p.titulo AS produto, 
    v.quantidade
FROM Vendas v
JOIN Utilizadores u ON v.utilizador_id = u.id
JOIN Produtos p ON v.produto_id = p.id;


-- ============================================================
-- CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Como é que um índice parcial melhora o desempenho das consultas de um analista de dados?
Resp. 1: Ao indexar apenas uma fração relevante dos dados (ex: quantidades >= 10 ou o ano atual), o índice ocupa muito menos memória RAM e acelera drasticamente as consultas executadas com frequência pelos dashboards de BI.

Perg. 2: Como é que o sistema de Branches do Neon substitui a necessidade de comandos complexos de terminal para clonar uma base de dados para testes?
Resp. 2: Permite criar uma cópia física instantânea da base de dados e respetivos dados na nuvem com um único clique (tecnologia Copy-on-Write), isolando o ambiente de desenvolvimento/análise do ambiente de produção sem qualquer risco.
*/
