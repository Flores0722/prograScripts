#!/bin/bash
opciones=(Multiplicar NumeroMayor Romanos Salir)
while true; do
    clear
    echo "Bienvenido/a que deseas convertir:"
    select opcion in ${opciones[@]}; do
        case $opcion in
            "Multiplicar")
                echo "Ha seleccionado la opcion para multiplicar"
                ./tablademultiplicar.sh
                ;;
            "NumeroMayor")
                echo "Ha seleccionado identicar el mayor de 5 numeros"
                ./numeromayor.sh
                ;;
            "Romanos")
                echo "Ha seleccionado la opcion covertir a romanos"
                ./romanos.sh
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
