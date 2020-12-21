#!/bin/sh

# cria a pasta se não houver
mkdir -p ~/.programas

# Entra na pasta
cd ~/.programas

# Descompacta o arquivo
tar -zxvf eclipse*.tar.gz

# Cria o atalho do executável
echo -e '[Desktop Entry]\n Version=1.0\n Name=eclipse\n Exec=/home/anderson/.programas/eclipse/eclipse\n Icon=/home/anderson/.programas/eclipse/icon.xpm\n Type=Application\n Categories=Desenvolvimento' | sudo tee /usr/share/applications/eclipse.desktop

# Faz um link simbólico do executavel para o path, util no rofi
sudo ln -s /home/anderson/.programas/eclipse/eclipse /usr/bin/eclipse
