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