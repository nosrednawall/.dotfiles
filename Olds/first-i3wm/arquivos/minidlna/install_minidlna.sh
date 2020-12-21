#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install minidlna -y
sudo cp -rf minidlna.conf /etc/minidlna.conf
# Cria as pastas que receberão os links simbólicos dos diretórios
sudo mkdir -p /var/lib/minidlna/videos
sudo mkdir -p /var/lib/minidlna/musicas

#sudo ln -s /media/hd-externo/StreamingMiniDLNA/Musicas/ /var/lib/minidlna/music
#sudo ln -s /media/hd-externo/StreamingMiniDLNA/Animes/ /var/lib/minidlna/videos/
#sudo ln -s /media/hd-externo/StreamingMiniDLNA/Doramas/ /var/lib/minidlna/videos/
#sudo ln -s /media/hd-externo/StreamingMiniDLNA/Filmes/ /var/lib/minidlna/videos/
#sudo ln -s /media/hd-externo/StreamingMiniDLNA/jojos/ /var/lib/minidlna/videos/
#sudo ln -s /home/anderson/Downloads/ /var/lib/minidlna/videos/
