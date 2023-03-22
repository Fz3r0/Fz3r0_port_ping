# Solicitar la dirección IP y el puerto al usuario
echo "Ingresa la dirección IP:"
read ip_address
echo "Ingresa el número de puerto:"
read port

# Verificar que se hayan proporcionado valores válidos para la dirección IP y el puerto
if [[ -z "$ip_address" || -z "$port" ]]; then
  echo "Se requiere especificar la dirección IP y el puerto."
  exit 1
fi

# Iniciar el bucle infinito de ping
while true; do
  echo -n "Pinging $ip_address:$port... "
  nc -vz $ip_address $port && echo "SUCCESS" || echo "FAILED"
  sleep 1
done
