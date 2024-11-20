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

# Для нечетного числа пропускаем центральное значение
if ((num % 2 != 0)); then
    central=$((half + 1))
else
    central=0
fi

# Вычисляем произведение первой половины чисел
mult=1
for ((i=1; i<=half; i++)); do
    mult=$((mult * i))
done

# Вычисляем сумму второй половины чисел, пропуская центральное значение
sum=0
for ((i=half+1; i<=num; i++)); do
    if ((i != central)); then
        sum=$((sum + i))
    fi
done

# Вывод результата
echo "mult : $mult"
echo "sum: $sum"
