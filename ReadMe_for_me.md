# Aides commandes

Il s'agit simplement d'un fichier pense-bête pour récapituler toutes les commandes que j'ai utilisé pour effectuer le TP.
Il y a également des explications, pour le cas où je reviendrais dans plusieurs mois ...

======================================================================================

Aide sur :

https://www.tecmint.com/install-joomla-on-debian/

https://www.hamrodev.com/en/app-development/joomla-docker-tutorial

https://docs.docker.com/compose/

https://docs.docker.com/samples/wordpress/

https://hub.docker.com/_/mysql

======================================================================================

# DOCKER

* créer un fichier Dockerfile

```bash
touch Dockerfile
```

## La config Dockerfile

    # Base Debian
    FROM debian:latest

    # Mise à jour du packagemanager et installation des éléments pour joomla
    RUN apt-get update -y \
    && apt-get install \
    && apt-get install apache2 -y \
    && apt-get install php7.3 -y \
    && apt-get install php-mysqli -y \
    && apt-get install php-xml -y

    # Ajouter l'archive joomla et décompresse l'archive dans le dossier joomla
    ADD Joomla_3.9.27-Stable-Full_Package.tar.gz /var/www/html/joomla

    # Le port
    EXPOSE 8080

    # Nom de notre appli installée dans le RUN
    # ENTRYPOINT ["service", "apache2", "start"] à la place mettre ça se qui lancera apache

    # Commande pour avoir le serveur tourner en tâche de fond (avant d'utiliser docker-compose)
    # CMD ["-D", "-f", "/etc/apache2/site-avaible/apache.conf"]

    # pour ouvrir un bash
    # ENTRYPOINT ["bin/bash"]

    # tâche principale permet d'utiliser un bash pour executer le ficher initialisationApache.sh
    ENTRYPOINT ["bash","initialisationApache.sh"]


---------------------------------------------------------------------------------------
## Commandes dans le terminal 

* création d'une image

```cmd
docker build -t debianjoomla:v1 .
docker build -t nom_du_container .
```

et tout à la fin : seulement du bleu et on a à nouveau la main 

* vérification création

```cmd
docker image ls
```

* lancer l'image

```cmd
docker run -d -p 80:80 debianjoomla:v1 .
docker run -d -p 80:80 nom_du_container
```

* pour ouvrir dans le terminal dans le container

```cmd
docker run -it nom_du_container
```

* pour créer un container et ouvrir un bash dedans

```cmd
docker run -it -p 80:80 debianjoomla:v1 bash
docker run -it nom_du_container bash
```

* vérification de la présence de php

```cmd
php -v
```

* pour voir et faire des commandes dans le container

```cmd
docker exec -it nom_du_container bash
```


======================================================================================

# DOCKER-COMPOSE

* créer un une fichier docker-compose.yml

```bash
touch docker-compose.yml
```

## la config docker-composer.yml

* Partie concernant Joomla : 

        version: "3.9"  # optional since v1.27.0
        services:
            joomla: 
                build: .  # donne le contexte (le Dockerfile)
                ports:
                    - "8080:80"
                # restart: always
                links:
                    - joomladb:mysql  
                volumes: # /gauche dossier_machine : /droite dossier_container
                    # liaison des 2 conf
                    - "./conf/joomla.conf:/etc/apache2/sites-available/joomla.conf" 

                    # utilisation du fichiers avec les variables d'env
                    - "./conf/initialisationApache.sh:/initialisationApache.sh" 

                environment:
                JOOMLA_DB_HOST: joomladb
                JOOMLA_DB_PASSWORD: example 


* Partie concernant la BDD : on ajoute une image mysql à joomla

            joomladb: # ajout d'une image de BDD mysql à joomla
                image: mysql:5.6
                ports:
                    - 3306
                # restart: always
                volumes: #création automatique 
                    - "./data:/var/lib/mysql"
                environment:
                    MYSQL_ROOT_PASSWORD: example

--------------------------------------------------------------------------------------
## Commandes dans le terminal 

* lancer docker compose (pour qu'il lie les images)

```cmd
docker-compose build
```

si c'est ok rend : 
```cmd
Successfully built 4d21e952e97b4e45abe6f76b3661fa9195cfa2e6303ae1e02900576405ac5595
```
j'obtient exited with code 0 signifie qu'il s'est arrêté (mais je n'ai pas d'erreur avant) 
```cmd
Creating tp-joomla_joomla_1 ... done
Attaching to tp-joomla_joomla_1
tp-joomla_joomla_1 exited with code 0
```

quand joomla sera installé (et que j'ai la config joomla.conf à la place de celle par défaut), si tout est ok j'aurai :
```cmd
joomladb_1  | Version: '5.6.51'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
joomla_1    | Site 000-default already disabled
joomla_1    | Site joomla already enabled
joomla_1    | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message    
```

* relancement/mise à jour

```cmd
docker-compose up 
```

* lancement en tâche de fond 

```cmd
docker-compose up -d
```

* arrêter docker compose

```cmd
docker-compose down 
```


======================================================================================

# APACHE

* ouvrir un terminal dans l'image

* Démarrer Apache
```cmd
service apache2 start
```

* Relancer Apache
```cmd
service apache2 restart
ou
service apache2 reload
```

( dans le cas où on souhaiterai utiliser directement une image existante 
* Lancer une image ubuntu/apache en local
```cmd
docker run -d --name apache2-container -e TZ=UTC -p 8080:80 ubuntu/apache2:2.4-21.04_beta
```
)

======================================================================================

# JOOMLA 

* le site se lance sur :
http://localhost:8080/


## Installation JOOMLA 

* lancer une commande dans un container déjà lancer
```cmd
docker exec -it tp-joomla_joomla_1 bash 
```

cette commande à permis d'ajouter le fichier : _JoomlajTlqywVqqPS2JLKPQH72G.txt
```bash
touch _JoomlajTlqywVqqPS2JLKPQH72G.txt
```

dans le dossier : /var/www/html/joomla/installation#
nécessaire pour finaliser l'installation de joomla et demandé par Joomla


## Lancement de Joomla

* dans un terminal : lancer docker-compose

```cmd
docker-compose up
```

* dans un terminal faire : lancer apache

```cmd
docker exec -it tp-joomla_joomla_1 bash
```

