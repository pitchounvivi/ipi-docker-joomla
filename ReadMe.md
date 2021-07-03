======================================================================================

Aide sur :

https://www.hamrodev.com/en/app-development/joomla-docker-tutorial

https://hub.docker.com/_/mysql

======================================================================================

# DOCKER

## création d'une image
```cmd
docker build -t debianjoomla:v1 .
docker build -t nom_du_container .
```

et tout à la fin : seulement du bleu et terminal ok

## vérification création
```cmd
docker image ls
```

## lancer l'image
```cmd
docker run -d -p 80:80 nom_du_container
```

## pour ouvrir dans le terminal dans le container
```cmd
docker run -it nom_du_container
```

## pour créer un container et ouvrir un bash dedans
```cmd
docker run -it nom_du_container bash
```

## vérification de la présence de php
```cmd
php -v
```

## pour voir et faire des commande dans le container
```cmd
docker exec -it nom_du_container bash
```

======================================================================================

# JOOMLA 

* créer un fichier Dockerfile

## la config Dockerfile

    # Base Debian
    FROM debian:latest

    # Mise à jour du packagemanager et installation des éléments pour joomla
    RUN apt-get update -y && apt-get install apache2 -y && apt-get install php7.3 -y && apt-get install php-mysqli -y && apt-get install php-xml -y

    # Ajouter l'archive joomla et décompresse l'archive dans le dossier joomla
    ADD Joomla_3.9.27-Stable-Full_Package.tar.gz /joomla

    # 


--------------------------------------------------------------------------------------
# DOCKER-COMPOSE

* créer un une fichier docker-compose.yml

## la config docker-composer.yml

### Partie concernant Joomla : 
    version: "3.9"  # optional since v1.27.0
    services:
        joomla: 
            build: .  # donne le contexte (le Dockerfile)
            ports:
                - "5000:80"


### Partie concernant la BDD : on ajoute une image mysql à joomla
    joomladb: 
        image: mysql:5.6
        ports:
            - 3306
        # restart: always
        volumes: #création automatique 
            - "./data:/var/lib/mysql"
        environment:
            MYSQL_ROOT_PASSWORD: example

--------------------------------------------------------------------------------------

## lancer docker compose (pour qu'il lie les images)
```cmd
docker-compose up 
```

si c'est ok rend : Successfully built 4d21e952e97b4e45abe6f76b3661fa9195cfa2e6303ae1e02900576405ac5595
et tout à la fin 
```cmd
Creating tp-joomla_joomla_1 ... done
Attaching to tp-joomla_joomla_1
tp-joomla_joomla_1 exited with code 0
```

## en tâche de fond 
```cmd
docker-compose up -d
```

## arrêter docker compose
```cmd
docker-compose down 
```





