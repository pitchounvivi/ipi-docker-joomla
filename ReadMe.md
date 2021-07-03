Pour ce TP récapitulatif, il vous est demandé de conteneurisation l'application CMS joomla (https://www.joomla.org/)

en respectant les critères ci-dessous:

    séparer autant que possible le services nécessaires à joomla dans des images docker séparées
    utiliser comme base d'image docker une image debian
    les fichiers de configuration doivent être montés à partir d'un repertoire source sur votre machine
    tous les logs applicatifs et middleware (apache, nginx, ...) doivent être déposé dans un volume central nommé : joomla-logs (attention à bien séparer les logs de chaque application)
    la base de donnée mysql doit être externalisée (les données ne doivent PAS être stockées dans le container)
    BONUS POINT:
        utiliser docker compose pour démarrer l'ensemble de la plateforme en une seule fois
        tirer partie au maximum des variables d'environnements utilisables dans docker-compose

pour vous aider:

    https://docs.docker.com/compose/
     
    https://docs.joomla.org/J3.x:Installing_Joomla
     

Livrables attendus:

    source produite par vos soins (fichiers, archives,....)
    les commandes nécessaires pour tester vos travaux.

en cas de besoin : rachid@sevenphere.io

N'ATTENDEZ PAS LE DERNIER JOUR POUR PRENDRE CONTACT AVEC MOI :(



======================================================================================================================

## création d'une image
docker build -t debianjoomla:v1 .
docker build -t nom_du_container .

## vérification création
docker image ls

## lancer l'image
docker run -d -p 80:80 nom_du_container

## pour ouvrir dans le terminal dans le container
docker run -it nom_du_container

## pour créer un container et ouvrir un bash dedans
docker run -it nom_du_container bash

## vérification de la présence de php
php -v

## pour voir et faire des commande dans le container
docker exec -it nom_du_container bash

----------------------------------------------------------------------------------------------------------------------
## créer un une fichier docker-compose.yml et créer la config

## lancer docker compose
docker-compose up 

si c'est ok rend : Successfully built 4d21e952e97b4e45abe6f76b3661fa9195cfa2e6303ae1e02900576405ac5595
et tout à la fin 
```cmd
Creating tp-joomla_joomla_1 ... done
Attaching to tp-joomla_joomla_1
tp-joomla_joomla_1 exited with code 0
```

## en tâche de fond 
docker-compose up -d

## arrêter docker compose
docker-compose down 
