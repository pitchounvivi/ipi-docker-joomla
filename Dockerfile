# Base Debian
FROM debian:latest

# Mise à jour du packagemanager dnf et install
RUN apt-get update && apt-get install -y && apt-get install apache2 -y && apt-get install libapache2-mod-php -y && apt-get install php-mysqli -y

#
