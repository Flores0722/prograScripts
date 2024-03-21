#!/bin/bash
opciones=(Longitud Masa Tiempo Almacenamiento Salir)
while true; do
    clear
    echo "Bienvenido/a que deseas convertir:"
    select opcion in ${opciones[@]}; do
        case $opcion in
            "Longitud")
                echo "Ha seleccionado Longitud"
                longitud
                ;;
            "Masa")
                echo "Ha seleccionado Masa"
                ;;
            "Tiempo")
                echo "Ha seleccionado Tiempo"
                ;;
            "Almacenamiento")
                echo "Ha seleccionado Almacenamiento"
                ;;
            "Salir")
                echo "Muchas gracias..."
                exit 0
                ;;
            *)
                echo "Opción inválida. Por favor, seleccione nuevamente."
                ;;
        esac
        break
    done
done
