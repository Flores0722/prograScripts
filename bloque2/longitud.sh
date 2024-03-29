#!/bin/bash

# variable para registro de intentos fallidos
# al momento de ingresar la cantidad
reintentos=0

# tabla de variables con equivalencias, tomando como base el metro
milimetros=1000
centimetros=100
metros=1
kilometros=0.001
millas=0.000621371
yardas=1.09361
pies=3.28084
pulgadas=39.3701

# variables que recibiran la equivalencia para utilizarla en la formula
medidaorigen=0
medidadestino=0

# variables que almacenaran los nombres de las medidas seleccionadas
medidaorigensel=""
medidadestinosel=""

# variable para la cantidad a convertir
cantidad=0

# arreglo de las diferentes medidas de longitud utilizadas
longitudes=(milimetros centimetros metros kilometros millas yardas pies pulgadas)

convertir(){
    case $medidaorigen in
        1)
            medidaorigen=$milimetros
            ;;
        2)
            medidaorigen=$centimetros
            ;;
        3)
            medidaorigen=$metros
            ;;
        4)
            medidaorigen=$kilometros
            ;;
        5)
            medidaorigen=$millas
            ;;
        6)
            medidaorigen=$yardas
            ;;
        7)
            medidaorigen=$pies
            ;;
        8)
            medidaorigen=$pulgadas
            ;;
    esac

    case $medidadestino in
        1)
            medidadestino=$milimetros
            ;;
        2)
            medidadestino=$centimetros
            ;;
        3)
            medidadestino=$metros
            ;;
        4)
            medidadestino=$kilometros
            ;;
        5)
            medidadestino=$millas
            ;;
        6)
            medidadestino=$yardas
            ;;
        7)
            medidadestino=$pies
            ;;
        8)
            medidadestino=$pulgadas
            ;;
    esac

    resultado=$(echo "scale=5; (($cantidad * $medidadestino) / $medidaorigen)" | bc)
    echo -e "\nUsted ha ingresado $cantidad $medidaorigensel y eso equivale a $resultado $medidadestinosel"
    echo "*** Gracias por utilizar nuestros sistemas ***"
    echo "Presione cualquier tecla para regresar al menú principal"
    read -n 1
    exit 0
}

ingresar_cantidad(){
    # iniciamos el ciclo while, el cual se repetirá hasta tres veces
    # que serían las oportunidades de ingresar un numero entero
    while true; do
        read -p "Ingresa un número entero -> " cantidad
        if ! [[ $cantidad =~ ^[0-9]+$ ]]; then
            ((reintentos++))
            echo -e "\nError: Debes ingresar un número entero.\n"
            # -lt = lower than
            if [ $reintentos -lt 3 ]; then
                ingresar_cantidad
            else 
               echo "Lo siento, las operaciones requieren un número entero"
               echo "Presione cualquier tecla para regresar al menú principal"
               # -n seguido de un numero, indica la cantidad de pulsaciones a presionar
               read -n 1
               exit 1
            fi
        else
            convertir
            break
        fi
    done
}


seleccionar_destino(){
    echo -e "\nSeleccione la unidad a la cual desea convertir: "
    select medidadestinosel in ${longitudes[@]}; do
        case $medidadestinosel in
            "milimetros"|"centimetros"|"metros"|"kilometros"|"millas"|"yardas"|"pies"|"pulgadas")
                medidadestino=$REPLY
                ingresar_cantidad 
                ;;
            *)
                echo "Opcion ingresada inválida"
                ;;
        esac
    done
}

seleccionar_origen(){
    echo -e "\nSeleccione la unidad de origen: "
    select medidaorigensel in ${longitudes[@]}; do
        case $medidaorigensel in
           "milimetros"|"centimetros"|"metros"|"kilometros"|"millas"|"yardas"|"pies"|"pulgadas")
                # $REPLY es una variable especial que guarda el valor ingresado por el usuario
                medidaorigen=$REPLY
                seleccionar_destino 
                ;;
            *)
                echo "Opcion ingresada inválida"
                ;;
        esac
    done
}

seleccionar_origen
