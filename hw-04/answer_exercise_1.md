# Practica 4

## Parte I - Ejercicios Linux

### Ejercicio 1

**Ordenar las IPs (en orden creciente)** 
**Buscar el número total ocurrencias por cada una de las IPs**

awk '{print $1}' nginx_logs_examples.log | uniq -c | sort -n

* awk '{print $1}': extrae los IP (la primera palabra de la línea)
* sort n: ordena los IP numéricos en orden ascendente
* uniq -c: cuanta la cantidad de veces que aparece cada IP


**Tras la ejecución del comando, guardar la salida en un fichero nginx_requests_total.txt** 

grep -o “awk '{print $1}' nginx_logs_examples.log | uniq -c | sort -n” > nginx_requests_total.txt

### Ejercicio 2
Crear el script y darle permisos de ejecución 
touch ejercicio2.sh && chmod +x ejercicio2.sh

*(El script se encuentra en el mismo directorio que nginx_logs_examples.log)*

### Ejercicio 3

59 23 * * 0-6 ./ejercicio2.sh
