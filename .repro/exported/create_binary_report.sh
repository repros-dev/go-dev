#!/bin/bash

path_to_binary=$1

echo "--------------------------------"
echo "Executable has these properties:"
echo "--------------------------------"
file -b ${path_to_binary} | sed "s/, /\\n/g"

libs=$(ldd ${path_to_binary}) 2> /dev/null
if [[ $? == 0 ]] ; then
    echo
    echo "------------------------------------------------"
    echo "Executable dynamically links to these libraries:"
    echo "------------------------------------------------"
    printf "${libs}" | sed "s/\\t//g" | sort
    echo
fi
