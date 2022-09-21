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
apt install ubuntu-desktop-minimal postgresql postgresql-contrib python3 default-jre python3-pip python3-opencv cmake build-essential python3-dev -y
systemctl start postgresql.service

#System
hostnamectl set-hostname C2
cd 

################
###### C2 ######
################

#Metasploit FrameWork 
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >> msfinstall.sh
chmod 755 msfinstall.sh 
./msfinstall.sh
rm -rf msfinstall.sh
curl https://github.com/trustedsec/unicorn/blob/master/unicorn.py >> unicorn.py
chmod 755 unicorn.py

#Covenant 
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt update -y
apt install apt-transport-https -y
apt install dotnet-sdk-3.1 dotnet-runtime-3.1 -y
git clone --recurse-submodules https://github.com/cobbr/Covenant

#Byop 
git clone https://github.com/malwaredllc/byob.git
cd byob/byob/
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install -r requirements.txt
cd 

#Viper [Need interact]
# wget -O f8x https://f8x.io/
# bash f8x -viper 

#TheFatRat 
git clone https://github.com/Screetsec/TheFatRat.git
cd TheFatRat
sudo chmod +x setup.sh 
#./setup.sh
#sudo ./update && chmod +x setup.sh && ./setup.sh
cd 

#########################
###### Other Tools ######
#########################

#PyArmor Obfuscation 
pip install pyarmor pyarmor-webui
