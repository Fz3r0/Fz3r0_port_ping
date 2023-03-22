#!/bin/bash

while getopts ":ip:po:" opt; do
  case $opt in
    ip)
      ip_address=$OPTARG
      ;;
    po)
      port=$OPTARG
      ;;
    \?)
      echo "Opción inválida: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Opción -$OPTARG requiere un argumento." >&2
      exit 1
      ;;
  esac
done

if [[ -z "$ip_address" || -z "$port" ]]; then
  echo "Se requiere especificar la dirección IP y el puerto. Uso: fz3r0_port_ping.sh -ip [IP ADDRESS] -po [PORT]"
  exit 1
fi

echo "Presione cualquier tecla para iniciar el ping infinito a $ip_address:$port"
read -n1 -r

while true; do
  echo -n "Pinging $ip_address:$port... "
  nc -vz $ip_address $port && echo "SUCCESS" || echo "FAILED"
  sleep 1
done
