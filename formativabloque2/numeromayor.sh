echo "Seleccionaré al mayor de 5 Numeros"
mayor=0
contador=1
for i in $(seq 1 5); do
    read -p "Numero ($contador) -> " num
    ((contador++))
    if [ $num -ge $mayor ]; then
        mayor=$num
    fi
done
echo -e "\nEl numero mayor es:\t$mayor"
echo "Presione cualquier tecla para regresar al menú"
read -n 1
            