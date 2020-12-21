#! /bin/bash
# instala as dependencias
#sudo apt install xdm qiv -y ;
sudo xbps-install xdm qiv
# cria a pasta para o wallpaper da tela e o copia
sudo mkdir -p /usr/local/share/backgrounds/
sudo cp -r wallpaper.jpg /usr/local/share/backgrounds/wallpaper.jpg

# copia os arquivos do xdm
sudo mv /etc/X11/xdm/Xresources /etc/X11/xdm/Xresources-original ;
sudo cp -r Xresources /etc/X11/xdm/Xresources ;
sudo mv /etc/X11/xdm/Xsetup /etc/X11/xdm/Xsetup-original ;
sudo cp -r Xsetup /etc/X11/xdm/Xsetup ;
sudo cp -r kumoko.xpm /usr/share/X11/xdm/pixmaps/komoko.xpm ;
