#!/bin/bash

# Antes de instalar MySQL actualizamos los repositorios de la maquina y después instalaremos MariaDB.
sudo apt update
sudo apt install -y mariadb-server

# Aquí habilitaremos el servicio y lo arrancaremos "puede llamarse mysql en la mayoría de versiones"
sudo systemctl enable mariadb || systemctl enable mysql
sudo systemctl start mariadb || systemctl start mysql

# Aquí se creará la base de datos y usuario
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS gestion_usuarios;
CREATE USER IF NOT EXISTS 'manuel'@'%' IDENTIFIED BY 'abcd';
GRANT ALL PRIVILEGES ON gestion_usuarios.* TO 'manuel'@'%';
FLUSH PRIVILEGES;
EOF