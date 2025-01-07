Traefik Docker local
====================
## Setting up a docker local development using `<whatever>.docker` as local domain without configuring host file

This repository gives basic source code for setting up a local development environment using Docker, Traefik, Dnsmasq, and various Content Management Systems (CMS).

## Prerequisites

- Docker installed on your machine.
- Docker Compose installed.

## Usage

1. Clone this repository. 
2. Run shell script `./configure-dnsmasq-macos.sh` to configure Dnsmasq.
3. Run shell script `./create-certs.sh` to create SSL selfsigned certificates.
4. Run shell script `./create-network.sh` to create a local network for Traefik.
5. Run `docker compose up -d` to start the services.
6. Go to your local CMS environment and add labels to your services in `docker-compose.override.yml` to enable Traefik to route traffic to your services.
7. Visit `https://myproject.docker` to see your local website.
8. Run `docker compose down` to stop the services.