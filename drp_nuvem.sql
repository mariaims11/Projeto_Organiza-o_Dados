-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: drp_nuvem.sql
-- ============================================================

-- 1. SCRIPT DE SIMULAÇÃO E RECONSTRUÇÃO EM CASO DE ERRO
DROP TABLE IF EXISTS Tabela_Critica_Teste;

CREATE TABLE Tabela_Critica_Teste (
    id SERIAL PRIMARY KEY,
    detalhe VARCHAR(50) NOT NULL
);


-- ============================================================
-- CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Se estiverem a usar uma base de dados 100% na nuvem (Neon) e apagarem uma tabela por engano, qual é a vantagem de ter o script schema.sql guardado no GitHub?
Resp. 1: Permite recriar instantaneamente a estrutura exata da tabela no SQL Editor sem perder tempo a tentar reescrever ou adivinhar o código original de arquitetura.

Perg. 2: Como é que a funcionalidade de Branches do Neon substitui a necessidade de scripts complexos de backup físico para testes de desastre?
Resp. 2: Permite clonar o estado tridimensional exato da base de dados na nuvem com um clique, isolando testes destrutivos de forma segura sem afetar o ambiente real de produção.

Perg. 3: Se um vírus apagar o servidor, quanto tempo demoramos a recuperar a empresa?
Resp. 3: O tempo necessário para carregar o script unificado de instalação noutra instância, que numa arquitetura cloud demora tipicamente menos de 5 minutos.

Perg. 4: Onde é que o nosso 'seguro de vida' está guardado?
Resp. 4: No GitHub, de forma descentralizada e fora do computador ou servidor físico que pode avariar.

Perg. 5: O que é que garante que não nos esquecemos de nenhum passo na reconstrução?
Resp. 5: O próprio script automatizado, que serve como uma lista de instruções lógicas e obrigatórias que o motor SQL executa sequencialmente sem falhas humanas.
*/
