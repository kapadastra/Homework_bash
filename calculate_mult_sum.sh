#!/bin/bash

# Получаем число
num=$1

# Проверка корректности ввода
if [[ -z "$num" || ! "$num" =~ ^[0-9]+$ ]]; then
    echo "Введите корректное число"
    exit 1
fi

# Определяем середину
half=$((num / 2))

# Вычисляем произведение первой половины чисел
mult=1
for ((i=1; i<=half; i++)); do
    mult=$((mult * i))
done

# Вычисляем сумму второй половины чисел
sum=0
for ((i=half+1; i<=num; i++)); do
    sum=$((sum + i))
done

# Вывод результата
echo "mult : $mult"
echo "sum: $sum"