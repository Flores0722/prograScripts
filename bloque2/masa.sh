#!/bin/bash

# variable para registro de intentos fallidos
# al momento de ingresar la cantidad
reintentos=0

# tabla de variables con equivalencias, tomando como base el metro
libras=1
onzas=16
gramos=453.592
kilogramos=0.453592
toneladas=0.000453592

# variables que recibiran la equivalencia para utilizarla en la formula
medidaorigen=0
medidadestino=0

# variables que almacenaran los nombres de las medidas seleccionadas
medidaorigensel=""
medidadestinosel=""

# variable para la cantidad a convertir
cantidad=0

# arreglo de las diferentes medidas de longitud utilizadas
masas=(libras onzas gramos kilogramos toneladas)

convertir(){
    case $medidaorigen in
        1)
            medidaorigen=$libras
            ;;
        2)
            medidaorigen=$onzas
            ;;
        3)
            medidaorigen=$gramos
            ;;
        4)
            medidaorigen=$kilogramos
            ;;
        5)
            medidaorigen=$toneladas
            ;;
    esac

    case $medidadestino in
        1)
            medidadestino=$libras
            ;;
        2)
            medidadestino=$onzas
            ;;
        3)
            medidadestino=$gramos
            ;;
        4)
            medidadestino=$kilogramos
            ;;
        5)
            medidadestino=$toneladas            
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
    select medidadestinosel in ${masas[@]}; do
        case $medidadestinosel in
            "libras"|"onzas"|"gramos"|"kilogramos"|"toneladas")
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
    select medidaorigensel in ${masas[@]}; do
        case $medidaorigensel in
           "libras"|"onzas"|"gramos"|"kilogramos"|"toneladas")
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
