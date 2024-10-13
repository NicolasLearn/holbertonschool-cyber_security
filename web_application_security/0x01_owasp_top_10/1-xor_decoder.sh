#!/bin/bash

# Vérifie si un argument est passé
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}<base64_string>"
    exit 1
fi

# Supprime le préfixe "{xor}" de la chaîne
sliced_password="${1#'{xor}'}"

# Décode la chaîne encodée en Base64
decoded_base64=$(echo "$sliced_password" | base64 --decode 2>/dev/null)

# Vérifie si le décodage Base64 a réussi
if [ $? -ne 0 ]; then
    echo "Erreur : Décodage Base64 échoué."
    exit 1
fi

# Initialise une variable pour stocker le résultat de l'opération XOR
decoded_password=""

# Parcourt chaque caractère de la chaîne décodée
for ((i=0; i<${#decoded_base64}; i++)); do
    # Récupère le caractère à la position actuelle
    char="${decoded_base64:i:1}"
    
    # Obtient le code ASCII du caractère
    ascii_value=$(printf "%d" "'$char")
    
    # Effectue l'opération XOR avec 95
    xor_value=$(( ascii_value ^ 95 ))
    
    # Convertit le résultat XOR en caractère
    xor_char=$(printf "\\$(printf '%03o' "$xor_value")")
    
    # Ajoute le caractère décodé à la variable finale
    decoded_password+="$xor_char"
done

# Affiche le résultat
printf "%s" "$decoded_password"

