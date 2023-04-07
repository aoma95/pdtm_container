#!/bin/bash

if [[ $# -eq 0 || "$1" == "-h" ]]; then
  echo "  _______       ____    _______       _____       ______      ___   ___            _       _______"
  echo " /__  ___/     // | |  /__  ___/     //   ) )     //   ) )       / /        /|    / /     /______/"
  echo "   / /        //__| |    / /        //   / /     //   / /       / /        //|   / /     //____"
  echo "  / /        / ___  |   / /        //   / /     //   / /       / /        // |  / /     / ____/"
  echo " / /        //    | |  / /        //   / /     //   / /       / /        //  | / /     //    __"
  echo "/ /        //     | | / /        ((___/ /     ((___/ /     __/ /___     //   |/ /     //____/ /"

  echo "ARGUMENT :"
  echo "  -h   : Permet d'afficher l'aide"
  exit 0
fi
