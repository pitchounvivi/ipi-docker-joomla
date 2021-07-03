# Base Debian
FROM debian:latest

# Mise à jour du packagemanager dnf et install
RUN apt-get update -y && apt-get install apache2 -y && apt-get install php7.3 -y && apt-get install php-mysqli -y  

# Ajouter l'archive joomla et décompresse l'archive joomla dans le dossier joomla
ADD Joomla_3.9.27-Stable-Full_Package.tar.gz /joomla




