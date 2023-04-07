#!/bin/bash
source ./script_utils/alias.sh

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
Liste des alias :
$(generate_text_alias)
EOF
)

if [[ $# -eq 0 || "$1" == "-h" ]]; then
  echo "$help_text"
  exit 0
fi
if [[ "$1" == "-i" ]]; then
  bash ./script_utils/state.sh
  exit 0
fi
if [[ "$1" == "-rm" ]]; then
  bash ./script_utils/delete.sh
  exit 0
fi
if [[ "$1" == "-a" ]]; then
  echo "$(generate_alias)"
  exit 0
fi
if [[ "$1" == "-rma" ]]; then
  echo "$(delete_all_aliases)"
  exit 0
fi
