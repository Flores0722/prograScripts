#!/bin/bash
nombre="Douglas Flores"
edad=17
echo su nombre es $nombre y su edad es $edad
# -ge = Greater or equal
# -le = Lower or equal
if [ $edad -ge 18 ]; then 
echo "usted tiene acceso vip"
else 
echo "usted es menor de edad larguese"
fi

# Crear una variable para almacenar la edad
