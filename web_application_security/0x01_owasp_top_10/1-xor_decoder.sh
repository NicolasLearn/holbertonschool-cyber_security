#!/bin/bash

# Vérifie si un argument est passé
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}<base64_string>"
    exit 1
fi

# Supprime le préfixe "{xor}"
password="${1#'{xor}'}"

# Décode la chaîne encodée en Base64
decoded_password=$(echo -n "$password" | base64 --decode | tr -d '\0')

if [ $? -ne 0 ]; then
    echo "Erreur : Décodage Base64 échoué."
    exit 1
fi

# Utilise Python pour effectuer l'opération XOR avec la clé 95
python3 -c "
import sys
decoded_password = '$decoded_password'
key = 95
output = ''.join([chr(ord(c) ^ key) for c in decoded_password])
print(output)
"
