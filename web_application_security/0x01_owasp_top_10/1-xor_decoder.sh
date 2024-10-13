#!/bin/bash

# Vérifie si un argument est passé
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}<base64_string>"
    exit 1
fi

# Supprime le préfixe "{xor}"
password="${1#'{xor}'}"

# Décode la chaîne encodée en Base64 en supprimant les lignes vides
decoded_password=$(echo -n "$password" | base64 --decode)

# Vérifie si le décodage Base64 a réussi
if [ $? -ne 0 ]; then
    echo "Erreur : Décodage Base64 échoué."
    exit 1
fi

# Initialise une variable pour stocker le résultat
output=""

# Parcourt chaque caractère de la chaîne décodée
for ((i = 0; i < ${#decoded_password}; i++)); do
    char="${decoded_password:$i:1}"
    
    # Effectue l'opération XOR avec 95 (en supprimant les octets nuls)
    xor_result=$(( $(printf "%d" "'$char") ^ 95 ))
    
    # Ajoute le résultat final à la sortie
    output+=$(printf "\\$(printf '%03o' $xor_result)")
done

# Affiche le résultat décrypté
echo "$output"
