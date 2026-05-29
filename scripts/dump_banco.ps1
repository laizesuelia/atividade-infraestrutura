# Script de Dump Simplificado contra erros de acentuação - ESIG
$DB_NAME = "postgres"

# Cria uma pasta direto no C:\ para evitar problemas com espaços e acentos
$BACKUP_DIR = "C:\backups-esig"
if (-not (Test-Path $BACKUP_DIR)) {
    New-Item -ItemType Directory -Path $BACKUP_DIR | Out-Null
}

$TIMESTAMP = Get-Date -Format "yyyyMMdd_HHmmss"
$BACKUP_FILE = "$BACKUP_DIR\backup_$TIMESTAMP.sql"

Write-Host "Buscando o utilitário pg_dump no sistema..." -ForegroundColor Yellow
$PG_DUMP_PATH = "C:\Program Files\PostgreSQL\18\bin\pg_dump.exe"

Write-Host "Iniciando o Dump do banco de dados: $DB_NAME..." -ForegroundColor Cyan
Write-Host "ATENÇÃO: Digite a senha do seu PostgreSQL do Windows quando solicitado abaixo!" -ForegroundColor Yellow

# Executa o backup salvando na pasta limpa do C:\
& $PG_DUMP_PATH -h localhost -U postgres -d $DB_NAME -F p -f $BACKUP_FILE -W

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Backup realizado com sucesso!" -ForegroundColor Green
    Write-Host "Arquivo salvo em: $BACKUP_FILE" -ForegroundColor Green
} else {
    Write-Host "ERROR: Falha ao realizar o backup." -ForegroundColor Red
}