#!/bin/bash
milimetros=1000
centimetros=100
metros=1
kilometros=0.001
millas=0.000621371
yardas=1.09361
pies=3.28084
pulgadas=39.3701
medidas=(1000 100 1 0.001 0.000621371 1.09361 3.28084 39.3701)
medidaorigen=0
medidadestino=0
cantidad=0
longitudes=(milimetros centimetros metros kilometros millas yardas pies pulgadas)

convertir(){
    #echo "$medidaorigen"
    #echo "$medidadestino"
    #echo "$cantidad"

    resultado=$(echo "scale=4; (($medida * $medidaorigen) / $medidadestino)" | bc)
    echo "$resultado"
}

ingresar_cantidad(){
    read -p "Ingresa un número entero: " cantidad
    if ! [[ $cantidad =~ ^[0-9]+$ ]]; then
        echo -e "\nError: Debes ingresar un número entero."
        echo -e "Presiona una tecla para continuar...\n"
        read -n 1
        return
    fi
    convertir
}


seleccionar_destino(){
    echo -e "\nSeleccione la unidad a la cual desea convertir: "
    select medidadestino in ${longitudes[@]}; do
        case $medidadestino in
            "milimetros")
                ingresar_cantidad 
                ;;
            "centimetros")
                ingresar_cantidad 
                ;;
            "metros")
                ingresar_cantidad 
                ;;
            *)
                echo "Opcion ingresada no valida"
                ;;
        esac
    done
}

seleccionar_origen(){
    echo -e "\nSeleccione la unidad de origen: "
    select medidaorigen in ${longitudes[@]}; do
        case $medidaorigen in
            "milimetros") 
                seleccionar_destino 
                ;;
        esac
    done
}

seleccionar_origen
