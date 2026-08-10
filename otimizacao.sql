-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: otimizacao.sql
-- ============================================================

-- 1. COMPARAÇÃO DE PERFORMANCES (EXPLAIN ANALYZE)
-- Teste Lento: Força o motor a varrer e empacotar todas as colunas
EXPLAIN ANALYZE SELECT * FROM Utilizadores WHERE nome = 'João Silva';

-- Teste Rápido: Abordagem cirúrgica que consome menos memória
EXPLAIN ANALYZE SELECT nome FROM Utilizadores WHERE nome = 'João Silva';


-- 2. PONTE SEGURA CONTRA O LOOP DA MORTE (JOIN + ON)
SELECT v.id AS venda_id, u.nome AS nome_cliente
FROM Vendas v
JOIN Utilizadores u ON v.utilizador_id = u.id;


-- ============================================================
-- RELATÓRIO DE CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Por que é que o SELECT * é o 'inimigo' da performance?
Resp. 1: Porque obriga o computador a ler e transportar colunas que não precisamos, desperdiçando tempo de CPU, rede e memória.

Perg. 2: Qual o comando que nos diz exatamente quantos milissegundos o computador demorou a responder?
Resp. 2: O comando EXPLAIN ANALYZE.

Perg. 3: O que acontece se nos esquecermos do ON num JOIN?
Resp. 3: O computador gera um Produto Cartesiano, multiplicando todas as linhas de uma tabela pelas da outra. O sistema entra em esforço e pode congelar.

Perg. 4: Ao pedirmos menos colunas, poupamos energia ao servidor?
Resp. 4: Sim, reduz-se drasticamente a transferência de dados (I/O) e o processamento de memória na Cloud Serverless.
*/
