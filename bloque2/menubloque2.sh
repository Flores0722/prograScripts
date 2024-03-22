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
                ;;
            "Masa")
                echo "Ha seleccionado Masa"
                ./masa.sh
                ;;
            "Tiempo")
                echo "Ha seleccionado Tiempo"
                ./tiempo.sh
                ;;
            "Almacenamiento")
                echo "Ha seleccionado Almacenamiento"
                ./almacenamiento.sh
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
