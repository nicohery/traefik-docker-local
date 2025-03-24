#!/bin/bash

# Folder containing your projects
PROJECTS_DIR="$HOME/Sites"
CERTS_DIR="./certs"
CERT_NAME="multi"

# Output files
CRT_FILE="${CERTS_DIR}/${CERT_NAME}.crt"
KEY_FILE="${CERTS_DIR}/${CERT_NAME}.key"
FULLCHAIN_FILE="${CERTS_DIR}/${CERT_NAME}.fullchain.crt"

# Make sure certs dir exists
mkdir -p "$CERTS_DIR"

# Build domain list from folder names
DOMAINS=("dev.multi.docker")
for dir in "$PROJECTS_DIR"/*/; do
  [ -d "$dir" ] || continue
    folder=$(basename "$dir")

    # Skip names with spaces or invalid characters
    if [[ "$folder" =~ [^a-zA-Z] ]]; then
      echo "⚠️  Skipping invalid folder name: $folder"
      continue
    fi

    domain="dev.${folder}.docker"
    DOMAINS+=("$domain")
done

# Echo for debug
echo "🔍 Domains to include in cert:"
printf "  - %s\n" "${DOMAINS[@]}"

# Generate cert
echo "🔐 Generating cert: $CERT_NAME"
mkcert -cert-file "$CRT_FILE" -key-file "$KEY_FILE" "${DOMAINS[@]}"

# Create fullchain
cat "$CRT_FILE" "$(mkcert -CAROOT)/rootCA.pem" > "$FULLCHAIN_FILE"

echo "✅ Certificate ready:"
echo " - $CRT_FILE"
echo " - $KEY_FILE"
echo " - $FULLCHAIN_FILE"