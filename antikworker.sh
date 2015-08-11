#!/bin/bash

#Programado de la forma menos chapucera posible por: http://jose-linares.com
#EJECUTAR COMO ROOT O NO FUNCIONARÁ

#Genera una lista para ver que gpe falla
grep . -r /sys/firmware/acpi/interrupts/ > lista

#Guarda en la variable $gpe la dirección completa del gpe erróneo
num=$(cat lista | egrep -o '[0-9]+ ' | sort -r -n | head -n1)
linea=$(cat lista | egrep -n "/sys/firmware/acpi/interrupts/gpe[A-Z,0-9]+:[ ]+$num" | cut -d":" -f1)
gpe=$(cat lista | head -n $linea | tail -n 1 | cut -d":" -f1)

#Manda señal de desactivación
echo "disable" > $gpe

rm lista


