#!/bin/bash

# Vérifier si les conteneurs sont déjà arrêtés
if [ "$(docker ps -aq -f status=exited)" ]; then
    # Les conteneurs existent, donc on les supprime
    echo "Suppression des conteneurs en cours..."
    echo "y" | docker compose -f ./script_utils/pdtm_docker_compose.yml rm &> /dev/null
    docker compose -f docker-compose.yml stop &> /dev/null
    echo "y" | docker compose -f docker-compose.yml rm &> /dev/null
    if [ $? -eq 0 ]; then
        echo "Suppression de Tatooine réussie."
        while [[ ! "$response" =~ ^[yn]$ ]]; do
            read -p "Voulez-vous supprimer le dossier bin des service TATOOINE (y/n) : " response
        done
        if [ "$response" = "y" ]; then
            sudo rm -rf ./bin
            echo "Le dossier bin des services pdtm a été supprimé avec succès."
        else
            echo "Le dossier bin des services pdtm n'a pas été supprimé."
        fi
    else
        echo "Erreur lors de la suppression de Tatooine."
    fi
else
    # Les conteneurs n'existent pas, donc on affiche un message d'erreur
    echo "Tatooine introuvable."
fi
