#!/bin/bash
# Vérifier si le dossier bin existe déjà
if [ ! -d bin ]; then
    # Le dossier n'existe pas, donc on le crée
    echo "Création du dossier bin..."
    mkdir bin
    echo "Le dossier bin a été créé avec succès."
else
    # Le dossier existe déjà, donc on ne fait rien
    echo "Le dossier bin existe déjà."
fi
# Définit le nom du conteneur à surveiller
docker compose -f ./script_utils/pdtm_docker_compose.yml up -d
NOM_CONTENEUR="pdtm"

# Définit la commande de notification
#COMMANDE_NOTIFICATION="echo 'Le conteneur $NOM_CONTENEUR a changé d'état en $1'"
COMMANDE_NOTIFICATION="echo \"Le conteneur $NOM_CONTENEUR a changé d'état en $1\""
# Lance une boucle infinie
while true; do
  # Obtient l'état actuel du conteneur
  ETAT_CONTENEUR=$(docker inspect --format '{{.State.Status}}' "$NOM_CONTENEUR")
  
  # Vérifie si le conteneur a démarré
  if [[ "$ETAT_CONTENEUR" == "running" ]]; then
    # Envoie une notification
    eval "$COMMANDE_NOTIFICATION" "démarré"
    echo "Installation en cours"
    
    # Attends que le conteneur s'arrête, en affichant une barre de progression
    pv -N "Attente de l'arrêt de $NOM_CONTENEUR" -W -t -i 1 < <(
      while [[ "$ETAT_CONTENEUR" == "running" ]]; do
        sleep 1
        ETAT_CONTENEUR=$(docker inspect --format '{{.State.Status}}' "$NOM_CONTENEUR")
      done
    )
    
    # Envoie une notification
    eval "$COMMANDE_NOTIFICATION" "arrêté"
    bash ./script_utils/write.sh
    docker compose up -d 
    echo "Les containers son opérationnelle"
    exit 0
  fi
  
  # Attend 1 seconde avant de vérifier à nouveau
  sleep 1
done
