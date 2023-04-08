# Project

░▀█▀░█▀█░▀█▀░█▀█░█▀█░▀█▀░█▀█░█▀▀ Dev: Dan ESPOSITO

░░█░░█▀█░░█░░█░█░█░█░░█░░█░█░█▀▀

░░▀░░▀░▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀

                                 Version:0.1

Tatooine est un outil open source basé sur ProjectDiscovery
Pdtm qui permet aux développeurs de simplifier l'installation et l'utilisation des outils de sécurité de ProjectDiscovery
tels que Nuclei, Subfinder, Naabu, et bien d'autres encore.
En utilisant Tatooine, les développeurs peuvent facilement installer, configurer et utiliser ces outils
en quelques commandes, sans avoir à se soucier des dépendances et des configurations complexes.

## Liste des services

-  [aix](https://github.com/projectdiscovery/aix) (un outil cli pour interagir avec les API Large Language Models)
-  [subfinder](https://github.com/projectdiscovery/subfinder) (Outil d'énumération de sous-domaine passif rapide)
-  [dnsx](https://github.com/projectdiscovery/dnsx) (Une boîte à outils DNS rapide et polyvalente conçue pour exécuter des requêtes DNS)
-  [naabu](https://github.com/projectdiscovery/naabu) (un outil d'analyse de ports écrit en Go qui vous permet d'énumérer les ports valides)
-  [httpx](https://github.com/projectdiscovery/httpx) (une boîte à outils HTTP rapide et polyvalente qui permet d'exécuter plusieurs sondes)
-  [nuclei](https://github.com/projectdiscovery/nuclei) (Scanner de vulnérabilité rapide et personnalisable basé sur un simple DSL basé sur YAML)
-  [uncover](https://github.com/projectdiscovery/uncover) (Découvrez rapidement les hôtes exposés sur Internet à l'aide de plusieurs moteurs de recherche)
-  [cloudlist](https://github.com/projectdiscovery/cloudlist) (Cloudlist est un outil multi-cloud permettant d'obtenir des ressources auprès de fournisseurs de cloud)
-  [proxify](https://github.com/projectdiscovery/proxify) (pour des déploiements rapides)
-  [tlsx](https://github.com/projectdiscovery/tlsx) (Un outil d'acquisition TLS rapide et configurable axé sur la collecte et l'analyse de données basées sur TLS)
-  [notify](https://github.com/projectdiscovery/notify) (un package d'assistance basé sur Go qui vous permet de diffuser la sortie de plusieurs outils)
-  [chaos-client](https://github.com/projectdiscovery/chaos-client) (Go client pour communiquer avec l'API de l'ensemble de données Chaos)
-  [shuffledns](https://github.com/projectdiscovery/shuffledns) (wrapper massDNS pour forcer brutalement et résoudre les sous-domaines avec prise en charge de la gestion des caractères génériques)
-  [mapcidr](https://github.com/projectdiscovery/mapcidr) (Un programme utilitaire pour effectuer plusieurs opérations pour une plage de sous-réseau/cidr donnée)
-  [interactsh-client](https://github.com/projectdiscovery/interactsh) (Une interaction OOB rassemblant serveur et bibliothèque client)
-  [katana](https://github.com/projectdiscovery/katana) (Un cadre d'exploration et d'araignée de nouvelle génération)
-  [asnmap](https://github.com/projectdiscovery/asnmap) (Accédez à la CLI et à la bibliothèque pour cartographier rapidement les plages de réseaux d'organisation à l'aide des informations ASN)
-  [simplehttpserver](https://github.com/projectdiscovery/simplehttpserver) (alternative de python SimpleHTTPServer)

## Prérequis
[![Docker](https://img.shields.io/badge/Docker-Version%20%3A%2023.0.1-informational)](https://docs.docker.com/engine/install/)

## Installation

### Aller dans le dossier git :

```bash
  source TATOOINE.sh -i
  
  # Pour efface les instalations
  source TATOOINE.sh -rm
```
### Pour afficher l'aide :
```bash
  source TATOOINE.sh
  #Ou
  source TATOOINE.sh -h



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
  -h   : Affiche l'aide
  -i   : Permet d'installer la solution TATOOINE
  -rm  : Supprimer l'install de TATOOINE
  -a   : Permet d'integrer les alias
  -rma : Permet de supprimer les alias
Liste des alias :
use_aix='docker exec aix aix' |  in_aix='docker exec -it aix /bin/sh' | pipe_use_aix='docker exec -i aix aix'
use_subfinder='docker exec subfinder subfinder' |  in_subfinder='docker exec -it subfinder /bin/sh' | pipe_use_subfinder='docker exec -i subfinder subfinder'
use_dnsx='docker exec dnsx dnsx' |  in_dnsx='docker exec -it dnsx /bin/sh' | pipe_use_dnsx='docker exec -i dnsx dnsx'
use_naabu='docker exec naabu naabu' |  in_naabu='docker exec -it naabu /bin/sh' | pipe_use_naabu='docker exec -i naabu naabu'
use_httpx='docker exec httpx httpx' |  in_httpx='docker exec -it httpx /bin/sh' | pipe_use_httpx='docker exec -i httpx httpx'
use_nuclei='docker exec nuclei nuclei' |  in_nuclei='docker exec -it nuclei /bin/sh' | pipe_use_nuclei='docker exec -i nuclei nuclei'
use_uncover='docker exec uncover uncover' |  in_uncover='docker exec -it uncover /bin/sh' | pipe_use_uncover='docker exec -i uncover uncover'
use_cloudlist='docker exec cloudlist cloudlist' |  in_cloudlist='docker exec -it cloudlist /bin/sh' | pipe_use_cloudlist='docker exec -i cloudlist cloudlist'
use_proxify='docker exec proxify proxify' |  in_proxify='docker exec -it proxify /bin/sh' | pipe_use_proxify='docker exec -i proxify proxify'
use_tlsx='docker exec tlsx tlsx' |  in_tlsx='docker exec -it tlsx /bin/sh' | pipe_use_tlsx='docker exec -i tlsx tlsx'
use_notify='docker exec notify notify' |  in_notify='docker exec -it notify /bin/sh' | pipe_use_notify='docker exec -i notify notify'
use_chaos-client='docker exec chaos-client chaos-client' |  in_chaos-client='docker exec -it chaos-client /bin/sh' | pipe_use_chaos-client='docker exec -i chaos-client chaos-client'
use_shuffledns='docker exec shuffledns shuffledns' |  in_shuffledns='docker exec -it shuffledns /bin/sh' | pipe_use_shuffledns='docker exec -i shuffledns shuffledns'
use_mapcidr='docker exec mapcidr mapcidr' |  in_mapcidr='docker exec -it mapcidr /bin/sh' | pipe_use_mapcidr='docker exec -i mapcidr mapcidr'
use_interactsh-client='docker exec interactsh-client interactsh-client' |  in_interactsh-client='docker exec -it interactsh-client /bin/sh' | pipe_use_interactsh-client='docker exec -i interactsh-client interactsh-client'
use_katana='docker exec katana katana' |  in_katana='docker exec -it katana /bin/sh' | pipe_use_katana='docker exec -i katana katana'
use_asnmap='docker exec asnmap asnmap' |  in_asnmap='docker exec -it asnmap /bin/sh' | pipe_use_asnmap='docker exec -i asnmap asnmap'
use_simplehttpserver='docker exec simplehttpserver simplehttpserver' |  in_simplehttpserver='docker exec -it simplehttpserver /bin/sh' | pipe_use_simplehttpserver='docker exec -i simplehttpserver simplehttpserver'
```

## Alias

Les alias permettent de faciliter l'utilisation des outils de TATOOINE.

```bash
  # Pour installer les alias
  source TATOOINE.sh  -a
  # Permet de supprimer les alias
  source TATOOINE.sh  -rma
```
## Il existe 3 types d'alias par service

#### Pour utiliser le service en question :

use_**NomDuService** Cette commande exécute la commande 'docker exec **NomDuService** **NomDuService**'

#### Pour entrer dans le container du service en question :

in_NomDuService Cette commande exécute la commande 'docker exec -it **NomDuService** /bin/sh'

#### Pour faire fonctionner deux services ensemble :

pipe_use_**NomDuService** Cette commande exécute la commande 'docker exec -i **NomDuService** **NomDuService**'


## Exemple

#### Commande de base :

subfinder -silent -d hackerone.com | dnsx -silent -a -resp

Se transforme en :   **(ÉVITEZ D'UTILISER L'ARGUMENT -silent)**

use_subfinder -d hackerone.com | pipe_use_dnsx  -a -resp


