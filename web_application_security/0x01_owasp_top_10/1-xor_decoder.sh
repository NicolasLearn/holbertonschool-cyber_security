#!/bin/bash

# Supprime le préfixe "{xor}"
password="${1#'{xor}'}"

# Décode la chaîne encodée en Base64
decoded_password=$(echo "$password" | base64 --decode)

# Décrypte la chaîne en utilisant XOR avec la clé 95
for ((i=0; i<${#decoded_password}; i++)); do
    # Obtenir le caractère et effectuer XOR
    printf "\\$(printf '%03o' $(( $(printf "%d" "'${decoded_password:i:1}") ^ 95 )))"
done

# Fin de ligne
echo
