#!/bin/bash

# Dotfiles - Simplesmente o que preciso para trabalhar em dar suporte à plataformas windows utilizando o debian

### Instalação WINE simplus intelbras

# Adiciono a arquitetura i386
sudo dpkg --add-architecture i386 

# Dependencias
sudo apt update && sudo apt install libgtk2.0-0:i386 libxxf86vm1:i386 libsm6:i386 lib32stdc++6

# o wine
sudo apt-get install winetricks wine32

mkdir -p  /home/$USER/.wine/intelbras
cd /home/$USER/.wine/intelbras
# baixe o simplus e coloque nessa pasta
wget -v http://backend.intelbras.com/sites/default/files/2019-12/SIMNext__Setup_v1.18.8.exe_.zip
unzip SIMNext__Setup_v1.18.8.exe_.zip
export WINEPREFIX=/home/$USER/.wine/intelbras
winetricks vcrun2005 
winetricks directx9
winetricks directplay
wine SIMNext__Setup_v1.18.8.exe
mkdir -p  /home/$USER/.inicializar
cat << EOF | tee -a  /home/$USER/.inicializar/simplus.sh
#!/bin/bash
#
#
export WINEPREFIX=/home/$USER/.wine/intelbras
#wine todo o caminho até o simplus
wine explorer.exe
exit 0
EOF
chmod a+x /home/$USER/.inicializar/simplus.sh
