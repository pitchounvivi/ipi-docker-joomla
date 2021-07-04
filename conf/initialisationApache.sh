
# shebang => permet la traduction du sh avec bash
#!/bin/bash

# import du fichier de variables d'environnement Apache (avec shell)
source /etc/apache2/envvars

sleep 5

# déactivation conf base et active conf joomla
a2dissite 000-default.conf
a2ensite joomla.conf

# commande qui lance Apache en tâche principale
apache2 -DFOREGROUND
