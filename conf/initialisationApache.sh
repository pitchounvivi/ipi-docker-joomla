
# shebang => permet la traduction du sh avec bash
#!/bin/bash

# import du fichier de variables d'environnement Apache (avec shell)
source /etc/apache2/envvars

# commande qui lance Apache en tâche principale
apache2 -DFOREGROUND
