#!/bin/bash

apt update
apt install -y apache2 php 

# Con estos comando descargamos la aplicación desde el GitHub Proporcionado.
wget -O app.zip https://informatica.iesalbarregas.com/mod/url/view.php?id=4382
unzip app.zip -d /var/www/html/
chown -R www-data:www-data /var/www/html/
systemctl restart apache2