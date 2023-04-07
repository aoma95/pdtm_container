#!/bin/bash

# Texte de l'aide
help_text=$(cat <<EOF
░▀█▀░█▀█░▀█▀░█▀█░█▀█░▀█▀░█▀█░█▀▀
░░█░░█▀█░░█░░█░█░█░█░░█░░█░█░█▀▀
░░▀░░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
                                 Version:0.1
Tatooine est un outil open source basé sur ProjectDiscovery
Pdtm qui permet aux développeurs de simplifier l'installation et l'utilisation des outils de sécurité de ProjectDiscovery tels que Nuclei, Subfinder, Naabu, et bien d'autres encore.
En utilisant Tatooine, les développeurs peuvent facilement installer, configurer et utiliser ces outils en quelques commandes, sans avoir à se soucier des dépendances et des configurations complexes.
ARGUMENTS :
  $(tput setaf 2)-h$(tput sgr0)   : Affiche l'aide
  $(tput setaf 2)-i$(tput sgr0)   : Permet d'installer la solution TATOOINE
  $(tput setaf 2)-rm$(tput sgr0)  : Supprimer l'install de TATOOINE
  $(tput setaf 2)-a$(tput sgr0)   : Permet d'integrer les alias
Liste des alias :
  $(echo -e "\e[33muse_aix\e[0m")='docker exec -it aix aix'
  $(echo -e "\e[33muse_asnmap\e[0m")='docker exec -it asnmap asnmap'
  $(echo -e "\e[33muse_chaos-client\e[0m")='docker exec -it chaos-client chaos-client'
  $(echo -e "\e[33muse_cloudlist\e[0m")='docker exec -it cloudlist cloudlist'
  $(echo -e "\e[33muse_dnsx\e[0m")='docker exec -it dnsx dnsx'
  $(echo -e "\e[33muse_httpx\e[0m")='docker exec -it httpx httpx'
  $(echo -e "\e[33muse_interactsh-client\e[0m")='docker exec -it interactsh-client interactsh-client'
  $(echo -e "\e[33muse_katana\e[0m")='docker exec -it katana katana'
  $(echo -e "\e[33muse_mapcidr\e[0m")='docker exec -it mapcidr mapcidr'
  $(echo -e "\e[33muse_naabu\e[0m")='docker exec -it naabu naabu'
  $(echo -e "\e[33muse_notify\e[0m")='docker exec -it notify notify'
  $(echo -e "\e[33muse_nuclei\e[0m")='docker exec -it nuclei nuclei'
  $(echo -e "\e[33muse_proxify\e[0m")='docker exec -it proxify proxify'
  $(echo -e "\e[33muse_shuffledns\e[0m")='docker exec -it shuffledns shuffledns'
  $(echo -e "\e[33muse_simplehttpserver\e[0m")='docker exec -it simplehttpserver simplehttpserver'
  $(echo -e "\e[33muse_subfinder\e[0m")='docker exec -it subfinder subfinder'
  $(echo -e "\e[33muse_tlsx\e[0m")='docker exec -it tlsx tlsx'
  $(echo -e "\e[33muse_uncover\e[0m")='docker exec -it uncover uncover'
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
  echo " " >> ~/.bashrc
  echo "# Ajout des alias pour les services docker" >> ~/.bashrc
  echo " " >> ~/.bashrc
  bash  ./script_utils/alias.sh >> ~/.bashrc
  source ~/.bashrc
  echo "Voici la liste des alias generé"
  alias | grep "^use"
  exit 0
fi
