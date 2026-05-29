# Desafio de Automação de Infraestrutura - ESIG Group

Este repositório contém a solução para o desafio técnico de infraestrutura, focado na automação de rotinas de backup de banco de dados e monitoramento resiliente de serviços de aplicação (Tomcat e JBoss).

## 🛠️ Arquitetura e Decisões Técnicas

Para garantir a entrega ágil, máxima compatibilidade e mitigar problemas de encoding de caminhos no ecossistema Windows, a solução foi desenvolvida utilizando **PowerShell Core**, a ferramenta padrão de mercado para automação em infraestrutura Microsoft.

* **Banco de Dados:** PostgreSQL 18.
* **Serviços de Aplicação:** Simulados via gerenciamento de processos e janelas nativas em background para garantir validação leve de lógica de recuperação (*Auto-healing*).
* **Diretório de Segurança:** Backups isolados nativamente em `C:\backups-esig` para mitigar falhas de caracteres especiais em rotas de usuários locais.

## 📂 Estrutura do Projeto

```text
atividade-infraestrutura/
│
├── scripts/
│   ├── dump_banco.ps1          # Automação de backup físico do Postgres
│   ├── simular_servicos.ps1     # Simulador de background do Tomcat/JBoss
│   └── verificar_instancias.ps1 # Script de monitoramento e Auto-healing (Regra de 1 min)
└── README.md                    # Documentação do projeto