#!/bin/bash

echo "Apagando NGINX y NGROK..."
sudo systemctl stop nginx
pkill ngrok  # Mata cualquier proceso en ejecución de ngrok

echo "Actualizando el repositorio..."
git config --global --add safe.directory /var/www/AWS-EC2-Example-1
cd /var/www/AWS-EC2-Example-1  # Cambia esto por la ruta real de tu repositorio
sudo git pull origin main  # O la rama que estés usando

echo "Moviendo archivos a la carpeta de publicación..."
sudo rsync -av /var/www/AWS-EC2-Example-1/ /var/www/html/  # 🔹 Cambia '/var/www/html/' según tu configuración

echo "Encendiendo NGINX..."
sudo systemctl start nginx

echo "Generando URL de NGROK..."
ngrok http 80 > /dev/null &  # Ejecuta ngrok en segundo plano en el puerto 80
sleep 5  # Espera unos segundos para que NGROK inicie

# Obtener la URL pública de NGROK
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')

echo "Despliegue completo. Accede a tu página en: $NGROK_URL"

