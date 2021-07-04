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

    # RUN chown -R www-data:www-data /var/www/html/joomla \
    #     && chmod -R 755 /var/www/html/joomla

    # Le port
    EXPOSE 8080


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

* pour voir et faire des commande dans le container

```cmd
docker exec -it nom_du_container bash
```


======================================================================================

# DOCKER-COMPOSE

* créer un une fichier docker-compose.yml

## la config docker-composer.yml

* Partie concernant Joomla : 

        version: "3.9"  # optional since v1.27.0
        services:
            joomla: 
                build: .  # donne le contexte (le Dockerfile)
                ports:
                    - "8080:80"
                links:
                    - joomladb:mysql  
                volumes:
                    - "../:/var/www/html"
                    #   - .:/code
                    #   - logvolume01:/var/log
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
docker compose build
```


```cmd
docker compose up 
```

si c'est ok rend : 
```cmd
Successfully built 4d21e952e97b4e45abe6f76b3661fa9195cfa2e6303ae1e02900576405ac5595
```
et tout à la fin 
```cmd
Creating tp-joomla_joomla_1 ... done
Attaching to tp-joomla_joomla_1
tp-joomla_joomla_1 exited with code 0
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

* Lancer une image ubuntu/apache en local
```cmd
docker run -d --name apache2-container -e TZ=UTC -p 8080:80 ubuntu/apache2:2.4-21.04_beta
```

docker run -d --name apache2-container -p 8080:80 apache2

======================================================================================

# JOOMLA 





