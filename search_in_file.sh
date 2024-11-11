#!/bin/bash

# Разбор параметров
file=""
search_str=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file) file="$2"; shift ;;
        --search) search_str="$2"; shift ;;
        *) echo "Неизвестный параметр: $1" ;;
    esac
    shift
done

# Проверка параметров
if [[ -z "$file" || -z "$search_str" ]]; then
    echo "Не все параметры заданы"
    exit 1
fi

# Проверка существования файла
if [[ ! -f "$file" ]]; then
    echo "Файл не найден"
    exit 1
fi

# Поиск совпадений
count=$(grep -o "$search_str" "$file" | wc -l)

# Вывод результата
if [[ "$count" -gt 0 ]]; then
    echo "Количество совпадений: $count"
else
    echo "Не найдено не одного совпадения в файле $(realpath "$file")"
fi
