#!/bin/bash

# Разбор параметров
url=""
browser_name=""
browser_version=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --url) url="$2"; shift ;;
        --browser) browser_name="$2"; shift ;;
        --version) browser_version="$2"; shift ;;
        *) echo "Неизвестный параметр: $1" ;;
    esac
    shift
done

# Проверка параметров
if [[ -z "$url" || -z "$browser_name" || -z "$browser_version" ]]; then
    echo "Не все параметры заданы"
    exit 1
fi

# Запуск тестов на Selenium Grid
mvn test -Dselenium.url="$url" -Dbrowser.name="$browser_name" -Dbrowser.version="$browser_version"
