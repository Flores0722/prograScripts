#!/bin/bash
clear
echo "Podrias darme tu nombre:"

#read nombre -> solicita una entrada de parte del usuario
#creando una variable llamada nombre en la cual se almacenará el contenido
read nombre 
clear
#read -p (-p = prompt = mensaje de peticion)
read -p "$nombre dame tu edad: " edad
clear
echo "Bienvenid@ $nombre, ahora sé que tu edad es $edad años"
