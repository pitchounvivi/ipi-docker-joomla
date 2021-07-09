# TP DOCKER 

Pour ce TP récapitulatif, il vous est demandé de conteneurisation l'application CMS **[Joomla!](https://www.joomla.fr/)** (https://www.joomla.org/) 

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



------------------------------------------------------------------
## Critères réussi :
- [X] Configuration dans un dossier séparé
- [X] BDD dans un dossier séparé
- [X] Utilisation d'une base Debian pour installer l'application et sa Base de Donnée
- [X] [1/3] Juste création du dossier devant recevoir les logs et tentative pour le faire (mais sans succès)
- [X] Utilisation de docker-compose pour automatiser l'ensemble
- [X] Utilisation de variables d'environnement


------------------------------------------------------------------
## Installation de Joomla

* Cloner le repository [ipi-docker-joomla](https://github.com/pitchounvivi/ipi-docker-joomla.git) dans un dossier sur votre ordinateur.

* ou décompressez le .zip dans un dossier

* Ouvrez le dossier avec votre ide ou VS Code

* Dans un 1er terminal :
    - lancez docker compose :

```cmd
docker-compose up
```

* Dans un 2ème terminal :
    - ouvrez le container de joomla :

```cmd
docker exec -it tp-joomla_joomla_1 bash
```

vous obtiendrez :
    root@75a9626ea204:/#

*   - lancer apache :

```cmd
service apache2 start
```

*  - Rendez-vous sur votre localhost:8080
