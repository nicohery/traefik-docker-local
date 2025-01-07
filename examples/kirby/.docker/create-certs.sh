#!/bin/bash

# Create self-signed certificates
if [ ! -d "certs" ]; then
  mkdir certs
fi

if [ ! -f "certs/selfsigned.key" ] || [ ! -f "certs/selfsigned.crt" ]; then
  openssl req -x509 -nodes -days 825 -newkey rsa:2048 -keyout certs/selfsigned.key -out certs/selfsigned.crt -subj "/CN=selfsigned"
fi -newkey rsa:2048 -keyout certs/selfsigned.key -out certs/selfsigned.crt -subj "/CN=selfsigned"