#!/bin/bash

# Avant de commencer, définir le nom du SMTP
smtp_server="adresse.de/monsmtp.php"

echo "Bienvenue"
read -p "NOM de l'expéditeur : " fname
read -p "MAIL de l'expéditeur : " mail
read -p "MAIL du destinataire : " to
read -p "OBJET du message : " sub
read -p "Message : " mes

name="'$fname'"
mes=${mes//&/\\&}

curl_command="curl --data \"name=$name&sender=$mail&email=$to&subject=$sub&message=$mes\" $smtp_server &> /dev/null"

echo "Commande curl générée :"
echo $curl_command

eval $curl_command

echo "Requête envoyée !"

