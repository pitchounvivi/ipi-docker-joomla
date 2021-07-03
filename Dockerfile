# Base Debian
FROM debian:latest

# Mise à jour du packagemanager dnf et install
RUN apt-get update && apt-get install -y

#
