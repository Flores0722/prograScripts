#!/bin/bash

# variable para registro de intentos fallidos
# al momento de ingresar la cantidad
reintentos=0

# tabla de variables con equivalencias, tomando como base el metro
dias=1
horas=24
minutos=1440
segundos=86400
semanas=0.142857
meses=0.0328767
anios=0.00273973

# variables que recibiran la equivalencia para utilizarla en la formula
medidaorigen=0
medidadestino=0

# variables que almacenaran los nombres de las medidas seleccionadas
medidaorigensel=""
medidadestinosel=""

# variable para la cantidad a convertir
cantidad=0

# arreglo de las diferentes medidas de longitud utilizadas
tiempos=(dias horas minutos segundos semanas meses anios)

convertir(){
    case $medidaorigen in
        1)
            medidaorigen=$dias
            ;;
        2)
            medidaorigen=$horas
            ;;
        3)
            medidaorigen=$minutos
            ;;
        4)
            medidaorigen=$segundos
            ;;
        5)
            medidaorigen=$semanas
            ;;
        6)
            medidaorigen=$meses
            ;;
        7)
            medidaorigen=$anios
            ;;
    esac

    case $medidadestino in
        1)
            medidadestino=$dias
            ;;
        2)
            medidadestino=$horas
            ;;
        3)
            medidadestino=$minutos
            ;;
        4)
            medidadestino=$segundos
            ;;
        5)
            medidadestino=$semanas
            ;;
        6)
            medidadestino=$meses
            ;;
        7)
            medidadestino=$anios
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
    select medidadestinosel in ${tiempos[@]}; do
        case $medidadestinosel in
            "dias"|"horas"|"minutos"|"segundos"|"semanas"|"meses"|"anios")
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
    select medidaorigensel in ${tiempos[@]}; do
        case $medidaorigensel in
           "dias"|"horas"|"minutos"|"segundos"|"semanas"|"meses"|"anios")
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
