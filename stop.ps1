# Остановка и удаление всех контейнеров из docker-compose
docker-compose -f ./docker-compose.yml down

# Удаление node_exporter, если вдруг он не из docker-compose (старый способ)
if (docker ps -a --format "{{.Names}}" | Where-Object { $_ -eq "node_exporter" }) {
    docker rm -f node_exporter | Out-Null
}

# Запись в лог
Add-Content -Path ./logs/control.log -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Docker services stopped"
