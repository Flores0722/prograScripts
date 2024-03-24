#!/bin/bash

# Creamos matrices que contienen su equivalente en cada posicion
unidades=(I II III IV V VI VII VIII IX)
decenas=(X XX XXX XL L LX LXX LXXX XC)
centenas=(C CC CCC CD D DC DCC DCCC CM)
millares=(M MM MMM)

convertir(){
# $1 => valor que viene por parametro
# -gt => greater than
# -lt => lower than
# -eq => equals
# -ge => greater or equal to
# -le => lower or equal to
# -ne => not equals
if [ $1 -gt 3999 ]; then
    echo "El número debe ser menor a 4000"
    echo "Presione cualquier tecla para continuar"
    read -n 1
    return
fi

                                # 2148      MM C XL VIII
u=$(( $1 % 10 ))                # extraer las unidades  -> 8
d=$(( ($1 / 10) % 10 ))         # extraer las decenas   -> 4
c=$(( ($1 / 100) % 10 ))        # extraer las centenas  -> 1
m=$(( $1 / 1000 ))              # extraer los millares  -> 2

# Construir el número romano
resultado=""
    if [ $m -ne 0 ]; then
        # m = 2
        mil=$(echo -n ${millares[$m-1]})
    fi
    if [ $c -ne 0 ]; then
        # c = 1
        cien=$(echo -n ${centenas[$c-1]})
    fi
    if [ $d -ne 0 ]; then
        diez=$(echo -n ${decenas[$d-1]})
    fi
    if [ $u -ne 0 ]; then
        # u = 8
        uni=$(echo -n ${unidades[$u-1]})
    fi
    resultado=$mil$cien$diez$uni
    echo "El numero $1 en romano se escribe así $resultado"
    echo "Presione cualquier tecla para regresar al menú"
    read -n 1
}

reintentos=0

ingreso(){
    while true; do
        read -p "Ingresa un número entero: " numero
        if ! [[ $numero =~ ^[0-9]+$ ]]; then
            ((reintentos++))
            echo -e "\nError: Debes ingresar un número entero."
            echo -e "Presiona una tecla para continuar...\n"
            read -n 1 -t 1
            if [ $reintentos -lt 3 ]; then
                ingreso
            else
                echo "Lo siento, solo es posible convertir desde un número entero!"
                read -t 2
                exit 1
            fi
        else 
            convertir $numero
            break
        fi
    done
}

ingreso