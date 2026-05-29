#!/bin/bash
echo "Iniciando instâncias simuladas..."
exec -a esig_tomcat sleep 999999 &
exec -a esig_jboss sleep 999999 &
echo "[OK] esig_tomcat inicializado em background."
echo "[OK] esig_jboss inicializado em background."