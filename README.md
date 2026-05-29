# Desafio de Automação de Infraestrutura

Link do vídeo: https://youtu.be/0raPaqIIv6I

Este repositório contém a solução para o desafio técnico de infraestrutura, focado na automação de rotinas de backup de banco de dados e monitoramento resiliente de serviços de aplicação (Tomcat e JBoss).

## 🛠️ Arquitetura e Decisões Técnicas

* **Banco de Dados:** PostgreSQL 18.
* **Serviços de Aplicação:** Simulados via gerenciamento de processos e janelas nativas em background para garantir validação leve de lógica de recuperação (*Auto-healing*).
* **Diretório de Segurança:** Backups isolados nativamente em `C:\backups-esig` para mitigar falhas de caracteres especiais em rotas de usuários locais.

## 📂 Estrutura do Projeto

```text
atividade-infraestrutura/
│
├── scripts/
│   ├── dump_banco.ps1          # Automação de backup físico do Postgres (Windows)
│   ├── simular_servicos.ps1     # Simulador de background do Tomcat/JBoss (Windows)
│   ├── verificar_instancias.ps1 # Script de monitoramento e Auto-healing (Windows)
│   │
│   ├── dump_banco.sh           # Automação de backup físico do Postgres (Linux)
│   ├── simular.sh              # Simulador de processos em background (Linux)
│   └── monitor.sh              # Script de monitoramento e Auto-healing (Linux)
└── README.md                    # Documentação do projeto

## ⚙️ Como Configurar o Ambiente

A solução foi projetada com foco em portabilidade, permitindo a validação da lógica de automação e resiliência em ambos os ecossistemas de desenvolvimento.
