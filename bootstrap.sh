#!/bin/bash

# Updating repository
echo "- Updating -------------"
sudo apt-get -y update
sudo apt-get -y upgrade

# Apache
echo "- Apache ----------------"
sudo apt-get -y install apache2
sudo service apache2 restart

# PHP
echo "- PHP -------------------"
sudo add-apt-repository ppa:ondrej/php
sudo apt-get -y update
sudo apt-get -y install php7.3 php7.3-cli php7.3-common
sudo apt-get -y install php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl
sudo service apache2 restart

# Base de datos
echo "- Database --------------"
sudo apt-get -y install software-properties-common dirmngr
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64] http://mirror.zol.co.zw/mariadb/repo/10.3/ubuntu xenial main'
sudo apt-get update
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password password wordpress"
sudo debconf-set-selections <<< "mariadb-server mysql-server/root_password_again password wordpress" 
sudo apt-get -y install mariadb-server mariadb-client
sudo service mysql restart
mysql -uroot -pwordpress -e "create database wordpress"

# Finish
echo "- Finish ----------------"

