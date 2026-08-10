-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: performance_avancada.sql
-- ============================================================

-- 1. INFRAESTRUTURA DE PERFORMANCE (ÍNDICE COMPOSTO DE ATALHO DUPLO)
ALTER TABLE Vendas ADD COLUMN IF NOT EXISTS data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE INDEX idx_cliente_data ON Vendas (utilizador_id, data_venda);

-- 2. VERIFICAÇÃO ANALÍTICA DO PLANO DE EXECUÇÃO
EXPLAIN ANALYZE 
SELECT * FROM Vendas WHERE utilizador_id = 1 AND data_venda <= CURRENT_TIMESTAMP;


-- ============================================================
-- RELATÓRIO DE CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Se criarmos um índice para todas as colunas da tabela, o que acontece quando tentamos inserir uma nova venda?
Resp. 1: O sistema fica extremamente lento a processar novos dados (INSERT), porque a cada nova linha o computador é obrigado a parar para atualizar e reordenar todos os índices em simultâneo.

Perg. 2: Para que serve o comando EXPLAIN ANALYZE aqui?
Resp. 2: Para abrir o raio-x operacional do motor e comprovar matematicamente que o índice composto está a acelerar a consulta ao evitar um rastreio sequencial total.

Perg. 3: O índice é uma cópia dos dados ou é apenas uma forma de organização?
Resp. 3: É uma estrutura de dados paralela e organizada (geralmente uma Árvore B-Tree) que armazena os valores ordenados e aponta cirurgicamente para a localização física dos dados originais no disco.

Perg. 4: Se eu criar um índice para a coluna 'Data', o que é que o computador cria no arquivo?
Resp. 4: Cria uma lista de referências cronológicas altamente ordenada que mapeia onde cada data se situa no disco, permitindo saltar direto para o corredor certo sem ler o armazém todo.
*/
