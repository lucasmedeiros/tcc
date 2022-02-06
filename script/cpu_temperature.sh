#!/bin/bash

TEMP_INPUT=$(echo /sys/class/hwmon/hwmon2/{temp1_input,temp2_input,temp3_input}) # mudar a pasta hwmon para a que estiver com os dados de temperatura da CPU no seu computador
HIGH_TEMP=$(echo "scale=1; $(sort -r $TEMP_INPUT | head -n1) / 1000" | bc)
CPU_IDLE=`top -b -n 3 | grep Cpu | tail -n 2 | head -1 | awk '{print $8}' | sed 's/,/./g'`
CPU_USAGE=$(echo $CPU_IDLE | awk '{temp = 100 - $1; print temp}')
TIMESTAMP=$(date +%s)
echo "${TIMESTAMP},${HIGH_TEMP},${CPU_USAGE}" >> ~/cpu.csv