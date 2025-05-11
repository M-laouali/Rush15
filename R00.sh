#!/bin/bash

# Fichier pour enregistrer les scores
SCORES_FILE="scores.txt"

# Générer un nombre aléatoire entre 1 et 100
SECRET_NUMBER=$(( RANDOM % 100 + 1 ))
ATTEMPTS=0

echo "Bienvenue dans le jeu de devinettes !"
echo "J'ai choisi un nombre entre 1 et 100. À vous de deviner."

while true; do
    read -p "Votre proposition : " GUESS

    # Vérifie si l'entrée est un nombre
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "❌ Entrez un nombre valide."
        continue
    fi

    ((ATTEMPTS++))

    if (( GUESS < SECRET_NUMBER )); then
        echo "🔼 Trop petit !"
    elif (( GUESS > SECRET_NUMBER )); then
        echo "🔽 Trop grand !"
    else
        echo "🎉 Bravo ! Vous avez trouvé en $ATTEMPTS tentatives."
        read -p "Entrez votre nom pour enregistrer votre score : " NAME
        echo "$NAME : $ATTEMPTS tentatives" >> "$SCORES_FILE"
        echo "✅ Score enregistré dans $SCORES_FILE"
        break
    fi
done
