#!/bin/bash


# Открываем базовый файл для чтения
set base_filename "имя_базового_файла.tcl"
set input_file [open $base_filename r]

# Создаем имя файла для записи результатов
set output_filename "${base_filename}_clean.tcl"
set output_file [open $output_filename w]

# Читаем базовый файл построчно
while {[gets $input_file line] != -1} {
    # Удаляем комментарии (строки, начинающиеся с символа "#")
    set cleaned_line [regsub -all {^\s*#.*} $line ""]
    
    # Удаляем символы после строки программного кода, заканчивающейся на ";"
    regsub -all {;.*} $cleaned_line "" cleaned_line
    
    # Записываем очищенную строку в файл с расширением "clean"
    puts $output_file $cleaned_line
}

# Закрываем файлы
close $input_file
close $output_file

puts "Комментарии удалены из файла. Результат сохранен в файле $output_filename."
