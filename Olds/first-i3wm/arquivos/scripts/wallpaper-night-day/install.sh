#!/bin/bash
# Cria pasta do script e cola o script nele
sudo mkdir -p /usr/local/scripts
sudo cp -r wallpaper-switcher.sh /usr/local/scripts/wallpaper-switcher
sudo chmod +x /usr/local/scripts/wallpaper-switcher

# Adiciona pasta de wallpapers e cola os wallpapers nele
sudo mkdir -p /usr/share/wallpapers/wallpaper-night-day
sudo cp -r day.jpg /usr/share/wallpapers/wallpaper-night-day/day.jpg
sudo cp -r night.jpg /usr/share/wallpapers/wallpaper-night-day/night.jpg

# adiciona linha do crontab para verificar as 06h00 da manhã
(crontab -l; echo "0 6 * * * /usr/local/scripts/wallpaper-switcher") | crontab -
# Adiciona linha do crontab para verificar as 18h00 da tarde
(crontab -l; echo "0 18 * * * /usr/local/scripts/wallpaper-switcher") | crontab -

# Adiciona o caminho dos scipts no seu path
echo "export PATH=$PATH:/usr/local/scripts/" >> /home/$USER/.bashrc
# Atualiza o seu path
source /home/$USER/.bashrc
# Executa o script
wallpaper-switcher
