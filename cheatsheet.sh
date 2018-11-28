#!/bin/bash

regex='(#.*)?bind(code|sym)\s(\S*)\s(.*)'

cat config | sed ':a;N;$ba;s/\(#.*\)\n/\1 /g' | \
    while read CMD; do
        if [[ $CMD =~ $regex ]]
        then
            if [[ ${BASH_REMATCH[0]} ]]
            then
                match="${BASH_REMATCH[0]}"
                commentary=`echo "${BASH_REMATCH[1]}" | awk '{$1=$1};1'`
                bind=`echo "${BASH_REMATCH[3]}" | awk '{$1=$1};1'`
                action=`echo "${BASH_REMATCH[4]}" | awk '{$1=$1};1'`
                printf "%-40s" "$bind" "$action" "$commentary"
                printf "\n"
            fi
        fi
    done
