#!/bin/bash

# .env file check
if [ ! -f .env ]; then
    echo "Error: .env file not found."
    exit 1
fi

# Load .env vars
export $(grep -v '^#' .env | xargs)

# check if DOMAIN var is set
if [ -z "$DOMAIN" ]; then
    echo "Error: DOMAIN env var is not set."
    exit 1
fi

# Criar a pasta certs se não existir
mkdir -p certs

# Gerar certificado SSL autoassinado
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./certs/selfsigned.key \
  -out ./certs/selfsigned.crt \
  -subj "/C=BR/ST=State/L=City/O=Company/OU=Org/CN=$DOMAIN"

echo "✅ Certs were successfully issued for $DOMAIN!"
