#!/bin/bash
mm=1000
cm=100
mt=1
km=0.001
ml=0.000621371
yd=1.09361
pie=3.28084
pulg=39.3701
longitudes=(milimetros centimetros metros kilometros millas yardas pies pulgadas)

read -p "Ingresa un número entero: " cantidad
if ! [[ $cantidad =~ ^[0-9]+$ ]]; then
    echo -e "\nError: Debes ingresar un número entero."
    echo -e "Presiona una tecla para continuar...\n"
    read -n 1
    return
fi

# | se denomina Pipe = tubería

# Modificador -e indica a Bash que el contenido incluye codigos de escapado
echo -e "\nAhora seleccione la unidad de origen:"
select origen in ${longitudes[@]}; do
    case $origen in
        "milimetros") 
            # Iniciamos bloque de operaciones aritmeticas utilizando bc
            totalmilimetros=$(echo "scale=4; (($cantidad * $mm) / $mm)" | bc)
            totalcentimetros=$(echo "scale=4; (($cantidad * $cm) / $mm)" | bc)
            totalmetros=$(echo "scale=4; (($cantidad * $mt) / $mm)" | bc)
            totalkilometros=$(echo "scale=4; (($cantidad * $km) / $mm)" | bc)
            totalpulgadas=$(echo "scale=4; (($cantidad * $pulg) / $mm)" | bc)
            totalpies=$(echo "scale=4; (($cantidad * $pie) / $mm)" | bc)
            totalyardas=$(echo "scale=4; (($cantidad * $yd) / $mm)" | bc)
            totalmillas=$(echo "scale=4; (($cantidad * $ml) / $mm)" | bc)

            # Presentamos los resultados al usuario
            echo "$cantidad $origen = $totalmilimetros milimetros"
            echo "$cantidad $origen =  $totalcentimetros centimetros"
            echo "$cantidad $origen =  $totalmetros metros"
            echo "$cantidad $origen =  $totalkilometros kilometros"
            echo "$cantidad $origen =  $totalpulgadas pulgadas"
            echo "$cantidad $origen =  $totalpies pies"
            echo "$cantidad $origen =  $totalyardas yardas"
            echo "$cantidad $origen =  $totalmillas millas"
            echo -e "Presiona una tecla para continuar...\n"
            read -n 1
            ;;
        "centimetros")
            totalmilimetros=$(echo "scale=4; (($cantidad * $mm) / $cm)" | bc)
            totalcentimetros=$(echo "scale=4; (($cantidad * $cm) / $cm)" | bc)
            totalmetros=$(echo "scale=4; (($cantidad * $mt) / $cm)" | bc)
            totalkilometros=$(echo "scale=4; (($cantidad * $km) / $cm)" | bc)
            totalpulgadas=$(echo "scale=4; (($cantidad * $pulg) / $cm)" | bc)
            totalpies=$(echo "scale=4; (($cantidad * $pie) / $cm)" | bc)
            totalyardas=$(echo "scale=4; (($cantidad * $yd) / $cm)" | bc)
            totalmillas=$(echo "scale=4; (($cantidad * $ml) / $cm)" | bc)
            echo -e "\n******* Resumen de Conversiones *******"
            echo "$cantidad $origen = $totalmilimetros milimetros"
            echo "$cantidad $origen =  $totalcentimetros centimetros"
            echo "$cantidad $origen =  $totalmetros metros"
            echo "$cantidad $origen =  $totalkilometros kilometros"
            echo "$cantidad $origen =  $totalpulgadas pulgadas"
            echo "$cantidad $origen =  $totalpies pies"
            echo "$cantidad $origen =  $totalyardas yardas"
            echo "$cantidad $origen =  $totalmillas millas"
            echo -e "Presiona una tecla para continuar...\n"
            read -n 1
            ;;
        "metros")
            echo "Ha seleccionado metros"
            ;;
        "kilometros")
            echo "Ha seleccionado kilometros"
            ;;
        "millas")
            echo "Ha seleccionado millas"
            ;;
        "yardas")
            echo "Ha seleccionado yardas"
            ;;
        "pies")
            echo "Ha seleccionado pies"
            ;;
        "pulgadas")
            echo "Ha seleccionado pulgadas"
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione nuevamente."
            ;;
    esac
    break
done