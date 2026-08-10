-- ============================================================
-- PROJETO: ORGANIZAÇÃO DE DADOS (UFCD 10797)
-- Ficheiro para o GitHub: privacidade.sql
-- ============================================================

-- 1. CAMADA DE ANONIMIZAÇÃO (VIEW)
CREATE OR REPLACE VIEW Vendas_Anonimas AS
SELECT id AS venda_id, produto_id, quantidade, 'CONFIDENCIAL' AS nome_cliente
FROM Vendas;

-- 2. INFRAESTRUTURA DE AUDITORIA DE CRIME DE DADOS (LOG + TRIGGER)
CREATE TABLE Log_Acessos (
    id SERIAL PRIMARY KEY,
    quem_fez_a_alteracao TEXT,
    data_acesso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registar_acesso() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Log_Acessos (quem_fez_a_alteracao) VALUES (current_user);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_auditoria_clientes
AFTER UPDATE ON Utilizadores
FOR EACH ROW
EXECUTE FUNCTION registar_acesso();


-- ============================================================
-- CONSOLIDAÇÃO TÉCNICA (PERGUNTAS DE VERIFICAÇÃO)
-- ============================================================
/*
Perg. 1: Para que serve a 'Vista' (VIEW) Vendas_Anonimas?
Resp. 1: Para permitir que programadores ou estagiários terceiros trabalhem na análise e lógica do sistema sem expor ou violar as informações privadas e sensíveis dos clientes.

Perg. 2: O que é o 'Direito ao Esquecimento'?
Resp. 2: É a obrigação legal imposta por regulamentos como o RGPD/GDPR de, caso um cliente o solicite explicitamente, apagarmos em definitivo todos os seus vestígios e dados pessoais do nosso sistema (DELETE FROM).

Perg. 3: Se um cliente ligar a queixar-se que os dados dele foram mal usados, como provamos que a empresa cumpriu a lei?
Resp. 3: Mostramos o 'Log_Acessos' para auditar rigorosamente quem acedeu e modificou os ficheiros e o carimbo histórico de que removemos os dados quando ele o solicitou.

Perg. 4: Um engenheiro de dados só cuida de máquinas, ou também cuida da ética?
Resp. 4: Cuida de ambos. Desenhar arquiteturas técnicas sem governança e ética representa um perigo de segurança e um risco financeiro e legal gigante para qualquer empresa.
*/
