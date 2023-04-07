#!/bin/bash

# Liste des services pour lesquels on veut créer des alias
#source ./list_service.sh
# Fichier .bashrc où les alias seront enregistrés
bashrc_file="$HOME/.bashrc"

# Parcourir la liste des services
function generate_alias(){
for service in "${services[@]}"
do
    # Vérifier si l'alias existe déjà dans le fichier .bashrc
    if grep -Fxq "alias use_$service='docker exec $service $service'" "$bashrc_file" && grep -Fxq "alias in_$service='docker exec $service $service /bin/sh'" "$bashrc_file" && grep -Fxq "alias pipe_use_$service='docker exec -i $service $service'" "$bashrc_file"
    then
       echo "L'alias pour le service service existe déjà dans le fichier .bashrc"
    else
        # Ajouter l'alias au fichier .bashrc
        echo "alias use_$service='docker exec $service $service'" >> "$bashrc_file"
        echo "alias in_$service='docker exec -it $service /bin/sh'" >> "$bashrc_file"
        echo "alias pipe_use_$service='docker exec -i $service $service'" >> "$bashrc_file"
        echo "L'alias pour le service $service a été ajouté dans le fichier .bashrc"
    fi
done
}

function generate_text_alias() {
  # Récupérer la largeur de la console pour ajuster la largeur des colonnes
  terminal_width=$(tput cols)

  # Calculer la largeur de chaque colonne
  col_width=$(( (terminal_width - 1) / 3,5 ))

  # Parcourir la liste des services
  for service in "${services[@]}"
  do
    # Construire les chaînes de caractères pour chaque alias
    use_alias="use_$service='docker exec $service $service'"
    in_alias="in_$service='docker exec -it $service /bin/sh'"
    pipe_alias="pipe_use_$service='docker exec -i $service $service'"

    # Ajouter des espaces pour aligner les colonnes
    use_alias=$(printf "%-${col_width}s" "$use_alias")
    in_alias=$(printf "%-${col_width}s" "$in_alias")
    pipe_alias=$(printf "%-${col_width}s" "$pipe_alias")

    # Afficher les trois alias sur une même ligne, avec des couleurs pour chaque service
    echo -e "\e[33m$use_alias | \e[0m $in_alias | \e[36m$pipe_alias\e[0m"
  done
}

function delete_all_aliases() {
  for service in "${services[@]}"
  do
    # Supprimer les alias du fichier .bashrc
    sed -i "/alias use_$service='docker exec $service $service'/d" "$bashrc_file"
    sed -i "/alias in_$service='docker exec -it $service \/bin\/sh'/d" "$bashrc_file"
    sed -i "/alias pipe_use_$service='docker exec -i $service $service'/d" "$bashrc_file"
  done
}
