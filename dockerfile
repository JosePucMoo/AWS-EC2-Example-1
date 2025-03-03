# Usa la imagen base de NGINX con Alpine para hacerlo más ligero
FROM nginx:alpine

# Copia tus archivos de la página web al contenedor
# Asume que tus archivos de la página web están en el directorio local ./public
COPY ./public /usr/share/nginx/html

# Expone el puerto 80 para acceder a la aplicación web
EXPOSE 80

# Comando para ejecutar NGINX en el contenedor
CMD ["nginx", "-g", "daemon off;"]
