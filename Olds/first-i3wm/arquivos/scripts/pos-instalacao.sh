#!/bin/sh

sudo dpkg --add-architecture i386

sudo apt update && sudo apt upgrade -y

sudo apt install vlc lame libavcodec-extra arc arj cabextract lhasa p7zip p7zip-full p7zip-rar rar unrar unace unzip xz-utils zip kget ktorrent telegram-desktop chromium chromium-l10n apt-transport-https latte-dock

echo "Deseja instalar os complementos do KDE ?"
