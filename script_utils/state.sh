#!/bin/bash

# Define the name of the container to monitor
echo "Création du container pdtm"
docker compose -f ./script_utils/pdtm_docker_compose.yml up -d
CONTAINER_NAME="pdtm"

# Define the notification command to use (e.g. a command that sends a notification to your phone)
NOTIFICATION_COMMAND="echo 'The container $CONTAINER_NAME a changé de statut en $1'"

# Start an infinite loop
while true; do
  # Get the current state of the container
  CONTAINER_STATE=$(docker inspect --format '{{.State.Status}}' "$CONTAINER_NAME")
  
  # Check if the container has started
  if [[ "$CONTAINER_STATE" == "running" ]]; then
    # Send a notification
    eval "$NOTIFICATION_COMMAND" "started"
    
    # Wait for the container to stop
    while [[ "$CONTAINER_STATE" == "running" ]]; do
      sleep 1
      CONTAINER_STATE=$(docker inspect --format '{{.State.Status}}' "$CONTAINER_NAME")
    done
    
    # Send a notification
    eval "$NOTIFICATION_COMMAND" "stopped"
    echo "Mise en place des service de pdtm en cours...."
    bash ./script_utils/write.sh
    docker compose  up -d --build
   echo "Installation fini"
    exit 0
  fi
  
  # Wait for 1 second before checking again
  sleep 1
done
exit 0
