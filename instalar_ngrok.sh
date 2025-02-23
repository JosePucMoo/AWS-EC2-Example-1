#!/bin/bash

# Añadir la clave pública de ngrok
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
| sudo tee /etc/apt/sources.list.d/ngrok.list \
&& sudo apt update \
&& sudo apt install ngrok

ngrok config add-authtoken 2tNipOof1VGXPjmYx6KaSOcUMw8_3GQiMXDJeCqu5Rbd9zSbt
