# Убедиться, что лог-папка существует
if (-not (Test-Path "./logs")) {
    New-Item -ItemType Directory -Path "./logs"
}

# Удалить старые контейнеры, если остались
$containers = @("victoriametrics", "grafana", "vmagent", "node_exporter")
foreach ($c in $containers) {
    if (docker ps -a --format "{{.Names}}" | Where-Object { $_ -eq $c }) {
        docker rm -f $c | Out-Null
    }
}

# Запуск docker-compose
docker-compose -f ./docker-compose.yml up -d

# Запись в лог
Add-Content -Path ./logs/control.log -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - Docker services started"

# Подождать 5 секунд
Start-Sleep -Seconds 5

# Открыть интерфейсы в браузере
Start-Process "http://localhost:8428/vmui"
Start-Process "http://localhost:3000"
