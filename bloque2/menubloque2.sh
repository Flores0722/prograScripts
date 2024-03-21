#!/bin/bash
opciones=(Longitud Masa Tiempo Almacenamiento Salir)
while true; do
    clear
    echo "Bienvenido/a que deseas convertir:"
    select opcion in ${opciones[@]}; do
        case $opcion in
            "Longitud")
                echo "Ha seleccionado Longitud"
                ./longitud.sh
                read -n 1
                ;;
            "Masa")
                echo "Ha seleccionado Masa"
                read -n 1
                ;;
            "Tiempo")
                echo "Ha seleccionado Tiempo"
                read -n 1
                ;;
            "Almacenamiento")
                echo "Ha seleccionado Almacenamiento"
                read -n 1
                ;;
            "Salir")
                echo "Muchas gracias..."
                exit 0
                ;;
            *)
                echo "Opción inválida. Por favor, seleccione nuevamente."
                read -n 1
                ;;
        esac
        break
    done
done
