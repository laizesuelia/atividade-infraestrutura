# Script de Monitoramento e Auto-Recuperação (Auto-healing) - ESIG
Clear-Host
Write-Host "Iniciando Monitoramento dos Serviços (Pressione Ctrl+C para parar)..." -ForegroundColor Cyan

$offline_counter = 0

while ($true) {
    # Procura se a janela do simulador está aberta no Windows
    $servidor_vivo = Get-Process | Where-Object {$_.MainWindowTitle -match "Servidores Ativos"}

    if ($servidor_vivo) {
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] [ONLINE] Tomcat e JBoss estão rodando normalmente." -ForegroundColor Green
        $offline_counter = 0
    } else {
        $offline_counter += 10
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] [ALERTA] Servidores estão FORA DO AR! Tempo offline: $offline_counter segundos." -ForegroundColor Red
        
        # REGRA EXTRA: Se ficar offline por mais de 1 minuto (60 segundos), reinicia
        if ($offline_counter -ge 60) {
            Write-Host "[RECOVERY] Instâncias offline há mais de 1 minuto! Reiniciando serviços automaticamente..." -ForegroundColor Yellow
            
            # Abre o simulador novamente em uma nova janela
            Start-Process powershell.exe -ArgumentList "-File C:\Desafio-Infraestrutura-ESIG\scripts\simular_servicos.ps1"
            $offline_counter = 0
        }
    }

    Start-Sleep -Seconds 10 # Executa a checagem a cada 10 segundos
}