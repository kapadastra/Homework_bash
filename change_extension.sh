#!/bin/bash

# Флаги для хранения параметров
declare -a files
current_ext=""
new_ext=""

# Разбор аргументов
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --file) files+=("$2"); shift ;;
        --extension) current_ext="$2"; shift ;;
        --replacement) new_ext="$2"; shift ;;
        *) echo "Неизвестный параметр: $1" ;;
    esac
    shift
done

# Проверка параметров
if [[ -z "$current_ext" || -z "$new_ext" || ${#files[@]} -eq 0 ]]; then
    echo "Не все параметры заданы."
    exit 1
fi

# Замена расширения и вывод результата
for file in "${files[@]}"; do
    new_file="${file%.*}.$new_ext"
    mv "$file" "$new_file"
    echo "$new_file"
done