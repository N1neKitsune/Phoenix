#!/bin/bash

####################
###### System ######
####################

#source.list modify server location
echo 'deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse' > /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list   
echo 'deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.canonical.com/ubuntu focal partner' >> /etc/apt/sources.list
echo 'deb-src http://archive.canonical.com/ubuntu focal partner' >> /etc/apt/sources.list

#Utilitary install and config
apt-get update -y
apt install ubuntu-desktop-minimal zip openssl mysql-server -y

#System 
hostnamectl set-hostname PhishingSRV

################################
###### Phishing Framework ######
################################

# Gophish 
mkdir -p /gophish
cd /gophish
wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip
unzip gophish*.zip
chmod +x gophish
#openssl req -newkey rsa:2048 -nodes -keyout gophish.key -x509 -days 365 -out gophish.crt
#sed -i 's/example.crt/gophish.crt/g' config.json
#sed -i 's/example.key/gophish.key/g' config.json
sed -i 's/sqlite3/mysql/g' config.json
sed -i 's/gophish.db/root:@(:3306)/gophish?charset=utf8&parseTime=True&loc=UTC/g' config.json
echo '[mysqld]' >> /etc/mysql/mysql.cnf
echo 'sql_mode=ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' >> /etc/mysql/mysql.cnf
mysql
CREATE DATABASE gophish CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
exit
echo \"@reboot root cd /gophish; ./gophish\" >> /etc/cron.d/mdadm
shutdown -r"