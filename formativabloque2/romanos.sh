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
    return
fi

                                # 2148
u=$(( $1 % 10 ))                # extraer las unidades  -> 8
d=$(( ($1 / 10) % 10 ))         # extraer las decenas   -> 4
c=$(( ($1 / 100) % 10 ))        # extraer las centenas  -> 1
m=$(( $1 / 1000 ))              # extraer los millares  -> 2

# Construir el número romano
    if [ $m -ne 0 ]; then
        # m = 2
        echo -n ${millares[$m-1]}   # m = 2 -> (2-1)
    fi
    if [ $c -ne 0 ]; then
        # c = 
        echo -n ${centenas[$c-1]}
    fi
    if [ $d -ne 0 ]; then
        echo -n ${decenas[$d-1]}
    fi
    if [ $u -ne 0 ]; then
        echo -n ${unidades[$u-1]}
    fi
    echo
}