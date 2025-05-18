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

2. Запусти мониторинг:

```bash
./start.ps1
```

3. Откроются интерфейсы:

- **VictoriaMetrics:** http://localhost:8428/vmui
- **Grafana:** http://localhost:3000

4. Чтобы остановить:

```bash
./stop.ps1
```

## 📈 Метрики по умолчанию

- **vmagent** отправляет метрики о себе и о victoriametrics
- **node_exporter** собирает системные метрики (CPU, память, диск)
- В будущем можно добавить другие источники Prometheus-метрик

## 🔐 Авторизация Grafana

При первом заходе на [http://localhost:3000](http://localhost:3000) будет открыта форма входа.

> Используй логин и пароль:
>
> - **Username:** `admin`
> - **Password:** `admin`

Grafana сразу же потребует изменить пароль. Сессия сохраняется в браузере, поэтому повторная авторизация не требуется.

## 📊 Дашборды Grafana

В репозитории сохранены дашборды, которые автоматически подгружаются при запуске Grafana:

- **Node Exporter Full** — мониторинг CPU, памяти, дисков, сети
- **VictoriaMetrics - single-node** — внутренние метрики TSDB

Файлы расположены в директории:
`grafana/dashboards/`

После запуска (`./start.ps1`) они будут доступны в Grafana: \
**Dashboards → Browse → General**

## 🧪 TODO / развитие

- Настроить автоматический импорт дашбордов
- Провести нагрузочное тестирование
- Написать отчёт о сравнении TSDB

## 🧑‍🎓 Автор
**[dixit12833]** \
Тема: Системы баз данных временных рядов на основе инструментов VictoriaMetrics