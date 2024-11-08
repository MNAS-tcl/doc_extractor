#!/bin/bash

DOC_EXTRACTOR_USAGE="
NAME
        $(dirname $0) 
        $(basename $0) 

В этом скрипте мы используем команду grep для поиска строк,
начинающихся с произвольного количества пробелов и содержащих
подстроку “##” за которыми следует один пробел в файле с расширением
*.tcl.

Опция -E указывает grep использовать расширенные регулярные
выражения.

Опция '^[[:space:]]*##[[:space:]]' указывает grep искать
строки, которые начинаются с произвольного количества пробелов, за
которыми следует символ “##”, за которым следует один пробел.

Затем мы используем команду sed для удаления пробелов, находящихся в
начале строки, и символов “##” и одного пробела.

Наконец, мы перенаправляем результаты работы скрипта в файл с
расширением *.org и именем (без расширения), которое было подано на
его вход."

show_usage ()
{
    echo "${DOC_EXTRACTOR_USAGE}"
}

main ()
{
    # Проверка количества параметров
    if [ "$#" -eq 0 ]
    then
        show_usage
    elif [ "$#" -eq 1 ]
    then
        # Get the input file name without extension
        FNAME_EXT=$(basename -- "$1")
        # echo ${FNAME_EXT}

        FNAME="${FNAME_EXT%.*}"
        #echo ${FNAME}

        # Process the file and write to output file
        grep -E '^[[:space:]]*##[[:space:]]' "$1" | \
            sed -E 's/^[[:space:]]+//' | \
            sed -E 's/^##[[:space:]]//' > "${FNAME}.org"
    fi
}

main "$@"
