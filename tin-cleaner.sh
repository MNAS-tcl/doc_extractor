#!/bin/bash

## Сохраните этот код в файл с расширением .sh (например,
## my_script.sh), сделайте его исполняемым (chmod +x my_script.sh), и
## затем запустите, передав ему имя файла с расширением “tin” в
## качестве аргумента. Программа выполнит указанные действия: выведет
## первые 10 строк файла, а затем отфильтрует строки, не начинающиеся
## с “//”, и запишет результат обратно в файл с тем же именем.

# Проверяем, что передано два аргумента
if [ $# -ne 2 ]; then
    echo "Ожидается два аргумента: имя программы и имя файла с расширением 'tin'."
    exit 1
fi

# Получаем имя файла из аргументов
filename="$2"

# Проверяем, что файл имеет расширение 'tin'
if [[ "$filename" != *.tin ]]; then
    echo "Файл '$filename' не имеет расширения 'tin'."
    exit 1
fi

# Выводим первые 10 строк файла в трубу
head -n 10 "$filename" | tee >(grep -v '^//' > "$filename")

