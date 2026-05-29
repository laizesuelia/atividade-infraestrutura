#!/bin/bash
OFFLINE_COUNTER=0
echo "Iniciando monitoramento de serviços no Linux..."
while true; do
    TOMCAT_ALIVE=$(pgrep -f esig_tomcat)
    JBOSS_ALIVE=$(pgrep -f esig_jboss)
    if [ -n "$TOMCAT_ALIVE" ] && [ -n "$JBOSS_ALIVE" ]; then
        echo "[$(date +%H:%M:%S)] [ONLINE] Tomcat e JBoss operando normalmente."
        OFFLINE_COUNTER=0
    else
        OFFLINE_COUNTER=$((OFFLINE_COUNTER + 10))
        echo "[$(date +%H:%M:%S)] [ALERTA] Serviços indisponíveis! Tempo: $OFFLINE_COUNTER s."
        if [ $OFFLINE_COUNTER -ge 60 ]; then
            echo "[RECOVERY] Ativando autocura..."
            /home/vboxuser/Desafio-ESIG/scripts/simular.sh
            OFFLINE_COUNTER=0
        fi
    fi
    sleep 10
done
