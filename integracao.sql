-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: integracao.sql
-- ============================================================

-- 1. TRANSFORMAÇÃO DE DADOS RELACIONAIS EM OBJETO JSON UNIVERSAL
-- Prepara o registo do Produto ID 1 para consumo de APIs externas ou Dashboards
SELECT json_build_object(
    'id', id,
    'nome_do_product_id', id,
    'nome_do_produto', titulo,
    'valor_final', preco
) AS resposta_para_o_site
FROM Produtos
WHERE id = 1;
