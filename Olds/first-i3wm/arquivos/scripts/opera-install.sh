#!/bin/sh

sudo apt update ; sudo apt upgrade -y ; sudo apt install apt-transport-https
sudo sh -c 'echo "deb https://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera-stable.list'
wget -q -O - https://deb.opera.com/archive.key | sudo apt-key add -
sudo apt update && sudo apt install opera-stable
