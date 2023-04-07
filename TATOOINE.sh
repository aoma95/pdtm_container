#!/bin/bash
source ./script_utils/alias.sh
source ./script_utils/list_service.sh
# Texte de l'aide
help_text=$(cat <<EOF


░▀█▀░█▀█░▀█▀░█▀█░█▀█░▀█▀░█▀█░█▀▀ Dev: Dan ESPOSITO
░░█░░█▀█░░█░░█░█░█░█░░█░░█░█░█▀▀
░░▀░░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
                                 Version:0.1
Tatooine est un outil open source basé sur ProjectDiscovery
Pdtm qui permet aux développeurs de simplifier l'installation et l'utilisation des outils de sécurité de ProjectDiscovery
tels que Nuclei, Subfinder, Naabu, et bien d'autres encore.
En utilisant Tatooine, les développeurs peuvent facilement installer, configurer et utiliser ces outils
en quelques commandes, sans avoir à se soucier des dépendances et des configurations complexes.

Usage TATOOINE:

    bash TATOOINE [OPTION]

Interaction des containers généré par TATOOINE :

   Utilisation simple :

      [ALIAS] CMD

   Utilisation complexe :

      [ALIAS] CMD | [ALIAS] CMD

OPTION :
  $(tput setaf 2)-h$(tput sgr0)   : Affiche l'aide
  $(tput setaf 2)-i$(tput sgr0)   : Permet d'installer la solution TATOOINE
  $(tput setaf 2)-rm$(tput sgr0)  : Supprimer l'install de TATOOINE
  $(tput setaf 2)-a$(tput sgr0)   : Permet d'integrer les alias
  $(tput setaf 2)-rma$(tput sgr0) : Permet de supprimer les alias

Liste des alias :

$(generate_text_alias)
EOF
)

end_text=$(cat <<EOF
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣀⣸⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⠾⠿⠿⠿⠛⠋⠁⠀⣠⣴⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⣠⣄⣀⣀⣀⣀⣀⣤⣤⣴⠶⠛⢋⣡⣴⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⣤⣬⣉⣉⣉⣉⡟⣁⠀⠀⠈⠙⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀Merci d'avoir utilisé nos service⠀
 ⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⡀⠛⠀⠀⠀⠀⣿⣿⠋⠉⠙⢿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ Bip Bip Bip !!!
 ⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⣀⣴⣿⣇⠀⠀⠀⣸⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡴⠟⠛⣁⠤⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠛⠛⣉⣡⠤⠒⠋⠁⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠤⠬⣉⣉⣉⣉⣠⠤⠤⠤⠴⠒⠚⠉⠁⠀⠀⠀⣤⣾⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⢀⣴⣶⣦⣤⣤⣤⣤⣤⣤⣤⣤⣴⣶⣶⣦⡀⠀⠈⠙⢿⣿⠋⠛⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⣰⣿⠿⠛⠉⠉⠉⠉⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⢿⣿⣿⣿⣦⡀⠀⠀⠀⠀
 ⠀⠀⠀⣼⠟⠁⢀⣠⣤⣤⣤⣄⡀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠉⠉⠉⠁⠀⠀⠀⠀
 ⠀⠀⣼⠃⠀⣴⣿⣿⣿⣿⣿⠟⠀⢀⡀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣀⣀⣀⡀⠀⠀
 ⠀⣸⠇⠀⠀⢹⣿⣿⣿⣿⣿⣤⣴⣿⣿⡄⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀
 ⢀⣿⠀⣿⣦⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀
 ⢸⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠻⠿⣿⡇⠀
 ⢸⣧⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⡿⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠘⡟⠀
 ⠈⣿⡀⠸⣿⡿⢿⣿⣿⣿⣿⣿⣄⠀⠈⠁⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⣠⣤⣶⣦⣄⠀⠀⠀
 ⠀⢿⣧⠀⠙⠀⢰⣿⣿⣿⣿⣿⣿⡷⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⡟⠁⠀⠀⣠⡀⠀⢻⣿⣿⣿⡿⠀⠀⠀
 ⠀⠘⣿⣷⡀⠀⠘⠛⠿⠿⠿⠛⠉⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⠏⠀⠀⢀⣴⣿⣷⣤⣼⣿⣿⣿⣠⠆⠀⠀
 ⠀⠀⠘⣿⣿⣦⣄⡀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⡏⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀
 ⠀⠀⠀⠘⢿⣿⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠘⠛⠛⣹⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢠⣶⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠈⠻⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
)
if [[ $# -eq 0 || "$1" == "-h" ]]; then
  echo "$help_text"
  return 0
fi
if [[ "$1" == "-i" ]]; then
  bash ./script_utils/state.sh
  return 0
fi
if [[ "$1" == "-rm" ]]; then
  bash ./script_utils/delete.sh
  echo "$end_text"
  return 0
fi
if [[ "$1" == "-a" ]]; then
  echo "$(generate_alias)"
  source $HOME/.bashrc
  return 0
fi
if [[ "$1" == "-rma" ]]; then
  echo "$(delete_all_aliases)"
  for service in "${services[@]}"
  do
    # Supprimer les alias du fichier .bashrc
    unalias "use_$service" 2>/dev/null
    unalias "in_$service" 2>/dev/null
    unalias "pipe_use_$service" 2>/dev/null
    if [ $? -eq 0 ]; then
      echo "Les alias pour le service $service ont été supprimés du fichier .bashrc"
    else
      echo "Les alias pour le service $service ne sont pas présent dans .bashrc"
    fi
  done
  source $HOME/.bashrc
  return 0
fi
