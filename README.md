# VictoriaMetrics Lab

📊 **Проект мониторинга временных рядов** с использованием [VictoriaMetrics](https://victoriametrics.com/), [Grafana](https://grafana.com/) и [vmagent], развернутый в Docker. Создан в рамках дипломной работы РТУ МИРЭА.

## 📦 Состав проекта

- **VictoriaMetrics** — основная TSDB (Time Series Database)
- **vmagent** — компонент для сбора метрик и отправки в TSDB
- **Grafana** — визуализация метрик и построение дашбордов
- **node_exporter** — экспорт системных метрик хоста

## 📁 Структура проекта
```bash
victoriametrics-lab/
├── config/ # Конфигурации vmagent и прочее
├── data/ # Хранилище метрик (volume)
├── grafana/ # Данные и настройки Grafana
├── logs/ # Логи запуска/остановки
├── scripts/ # Скрипты PowerShell (start/stop)
├── results/ # (опц.) Результаты тестирования
├── report/ # Материалы диплома
├── .env # Переменные окружения
├── docker-compose.yml
├── start.ps1 # Запуск всех компонентов
└── stop.ps1 # Остановка всех компонентов
```
## ⚙️ Быстрый старт

> ⚠️ Убедись, что у тебя установлен [Docker](https://www.docker.com/) и [Docker Compose](https://docs.docker.com/compose/)  
> ✅ Запуск осуществляется из PowerShell (Windows 11)

1. Клонируй репозиторий:

```bash
git clone https://github.com/<ваш-логин>/victoriametrics-lab.git
cd victoriametrics-lab
```