#!/bin/bash

echo "Welcome to the basic calculator!" | tee -a operation_history.txt
echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
read input
echo "$input" >> operation_history.txt

while [ "$input" != "quit" ];
do
    if [[ "$input" =~ ^[-,0-9,.]+[[:space:]]+[-,+,*,/,^][[:space:]]+[-,0-9,.]+$ ]]; then
        echo "$(echo "scale=2; $input" | bc -l)" | tee -a operation_history.txt
    else
        echo "Operation check failed!" | tee -a operation_history.txt
    fi;
    echo "Enter an arithmetic operation or type 'quit' to quit:" | tee -a operation_history.txt
    read input
    echo "$input" >> operation_history.txt
done
echo "Goodbye!" | tee -a operation_history.txt