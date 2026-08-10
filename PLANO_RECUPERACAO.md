# Plano de Recuperação de Desastres (DRP) - Organização v1.0
**Disciplina:** Organização de Dados (UFCD 10797)

Este documento estabelece o protocolo de engenharia para restauração rápida da base de dados em caso de falha crítica ou erro humano.

## Opção 1: Restauro Físico na Nuvem (Neon Console)
Em caso de perda de dados acidental no ramo principal:
1. Aceder ao menu **Branches** no painel da Neon.
2. Selecionar o ramo de segurança estável `backup_seguranca_h9`.
3. Validar a integridade através do SQL Editor ou utilizar a ferramenta **Backup & Restore** (PITR) para recuar a base de dados ao minuto exato anterior à ocorrência do incidente através da opção *Restore from history*.

## Opção 2: Reconstrução Lógica Automática (GitHub)
Caso a infraestrutura sofra uma corrupção completa:
1. Clonar o repositório ou aceder à raiz do projeto.
2. Copiar o conteúdo integral do script `setup_completo.sql`.
3. Executar o código no Neon SQL Editor da nova instância para recriar as tabelas, chaves estrangeiras, índices de performance e permissões RBAC (`estagiario_leitor`) de forma 100% automatizada.
