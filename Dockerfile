# Base Debian
FROM debian:latest

# Mise à jour du packagemanager et installation des éléments pour joomla
RUN apt-get update -y && apt-get install apache2 -y && apt-get install php7.3 -y && apt-get install php-mysqli -y && apt-get install php-xml -y

# Ajouter l'archive joomla et décompresse l'archive dans le dossier joomla
ADD Joomla_3.9.27-Stable-Full_Package.tar.gz /joomla

# 


