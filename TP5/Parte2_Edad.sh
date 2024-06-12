#!/bin/bash

#variable para verificar que ingreso una cadena
verificar_cadena=0 

echo "Parte 2 - Edad probable segun su nombre"

read -p "Por favor, ingrese un nombre: " nombre

#while para verificar el ingreso de una cadena
while [ "$verificar_cadena" -eq 0 ];
    do
        if [[ -z "$nombre" ]];
            then
                echo "Vuelva a nitentar"
                verificar_cadena=0    
                read nombre
        else
            verificar_cadena=1            
        fi
done

#la variable api guarda los datos que le da la api del nombre ingresado
api=$(curl -s "https://api.agify.io/?name=$nombre")

#la variable edad guardara la edad, esta se encuentra haciendo 2 greps, el primero busca la parte donde se encuentra age:.. y el segundo grep agarra solo la edad
edad=$(echo $api | grep -o '"age":[^,]*' | grep -o '[0-9]\+')

#verificacion de los datos devueltos por la pagina
if [ -n "$edad" ]; 
    then
        echo "La edad promedio para el nombre $nombre es: $edad"
    else
        echo "No se encontró información para el nombre $nombre"
fi