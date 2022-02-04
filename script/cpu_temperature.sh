#!/bin/bash

TEMP_INPUT=$(echo /sys/class/hwmon/hwmon4/temp1_input)
HIGH_TEMP=$(echo "scale=1; $(sort -r $TEMP_INPUT | head -n1) / 1000" | bc)
TIMESTAMP=$(date +%s)
echo "${TIMESTAMP},${HIGH_TEMP}" >> ~/cpu.csv
