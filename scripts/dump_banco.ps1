#!/bin/bash
DB_NAME="esig_infra"
BACKUP_DIR="/home/vboxuser/Desafio-ESIG/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.sql"
export PGPASSWORD="admin"
echo "Iniciando o Dump do banco de dados: $DB_NAME..."
pg_dump -h localhost -U postgres -d $DB_NAME -F p -f $BACKUP_FILE
if [ $? -eq 0 ]; then
    echo "SUCCESS: Backup realizado com sucesso!"
else
    echo "ERROR: Erro ao realizar o backup do banco de dados."
fi
unset PGPASSWORD
