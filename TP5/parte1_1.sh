#!/bin/bash
numero_random=$((1 + $RANDOM % 100))
encontrado=0
echo "Parte 1 - Adivinacion de numero aleatorio"
echo "Ingrese un numero para empezar a adivinar y se le dira si el numero ingresado es mas chico o mas grande que el numero aleatorio"

while [ "$encontrado" -eq 0 ];
do
    read numero
    numero_ingresado=$numero
    if [[ "$numero_ingresado" -gt "$numero_random" ]];
        then
            echo "El numero ingresado es mayor"
        elif [[ "$numero_ingresado" -eq "$numero_random" ]];
            then
                echo "GENIAL encontraste el numero correcto"
                encontrado=1
            else
                echo "El numero ingresado es menor"
            fi
done
