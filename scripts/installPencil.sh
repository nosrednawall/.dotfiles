#!/bin/bash

sudo apt install wget
mkdir -p .programas
cd .programas
wget https://pencil.evolus.vn/dl/development/Pencil-3.1.0.20201226003002.tar.gz
tar xf Pencil*.tar.gz
cd pencil-3.1.0.20201226003002/
sudo chown root:root chrome-sandbox
sudo chmod 4755 chrome-sandbox
sudo chmod +x pencil

wget https://pencil.evolus.vn/styling/images/logo-shadow.png

NAME="Pencil" 
GENERICNAME="Pencil"
EXECPATH="./home/$USER/.programas/pencil-3.1.0.20201226003002/pencil --help"
ICONPATH="/home/$USER/.programas/pencil-3.1.0.20201226003002/logo-shadow.png"
COMMENT=""

cat <<< '
[Desktop Entry]
Name='${NAME}'
Comment='${COMMENT}'
GenericName='${GENERICNAME}'
Exec='${EXECPATH}'
Icon='${ICONPATH}'
Type=Application
StartupNotify=false
StartupWMClass='${NAME}'
Categories=Application;
MimeType=text/plain;inode/directory;
Actions=new-empty-window;
Keywords='${NAME}';

[Desktop Action new-empty-window]
Name=New Empty Window
Exec='${EXECPATH}'
Icon='${ICONPATH}'
' > '/home/anderson/.local/share/applications/'${NAME}'.desktop'
