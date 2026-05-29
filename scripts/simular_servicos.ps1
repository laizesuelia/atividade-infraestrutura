# Simulador de Instâncias para o Teste ESIG
$Host.UI.RawUI.WindowTitle = "Servidores Ativos - Tomcat e JBoss"
Clear-Host
Write-Host "          ESIG - SIMULADOR DE SERVIÇOS              " -ForegroundColor Cyan
Write-Host "[OK] Processo simulado: Apache Tomcat (Porta 8080)" -ForegroundColor Green
Write-Host "[OK] Processo simulado: JBoss WildFly (Porta 8081)" -ForegroundColor Green
Write-Host "Mantenha esta janela aberta para simular os servidores ONLINE." -ForegroundColor Yellow
Write-Host "Feche esta janela para simular uma QUEDA dos serviços." -ForegroundColor Red

while ($true) { Start-Sleep -Seconds 1 }