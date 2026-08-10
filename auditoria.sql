-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: auditoria.sql
-- ============================================================

-- 1. CRIAÇÃO DA TABELA DO LIVRO DE VISITAS
CREATE TABLE Auditoria_Precos (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    preco_antigo DECIMAL(10, 2),
    preco_novo DECIMAL(10, 2),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CRIAÇÃO DA FUNÇÃO PL/PGSQL (O PORTEIRO)
CREATE OR REPLACE FUNCTION registar_alteracao()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Auditoria_Precos (produto_id, preco_antigo, preco_novo)
    VALUES (OLD.id, OLD.preco, NEW.preco);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. CRIAÇÃO DO GATILHO (TRIGGER AUTOMÁTICO)
CREATE TRIGGER porteiro_precos
AFTER UPDATE ON Produtos
FOR EACH ROW 
EXECUTE FUNCTION registar_alteracao();


-- ============================================================
-- RELATÓRIO DE CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Se o Diretor perguntar 'quem alterou o preço do Livro A?', o que respondem?
Resp. 1: Consulto a tabela Auditoria_Precos para extrair o ID do produto, o histórico de valores e a data exata da transação.

Perg. 2: O que é um 'Gatilho' (Trigger)?
Resp. 2: É um bloco de código que corre automaticamente na base de dados sempre que ocorre um evento específico (INSERT, UPDATE ou DELETE) numa determinada tabela.

Perg. 3: O Trigger é uma coisa que vocês têm de correr manualmente todos os dias?
Resp. 3: Não. O Trigger funciona como um vigilante passivo que atua 24h por dia em segundo plano, disparando no exato milissegundo em que a tabela-alvo é modificada.

Perg. 4: Por que é que o OLD e o NEW são as palavras mais importantes aqui?
Resp. 4: Porque o OLD representa o estado da linha antes de ser modificada (preço antigo) e o NEW representa o novo estado inserido (preço novo), permitindo o cálculo do diferencial ou registo de auditoria.
*/
