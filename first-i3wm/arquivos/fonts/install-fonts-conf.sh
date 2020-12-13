#!/bin/bash
# Possibilita a execucao de fonts bitmap no debian
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf

# Cria o diretório para o arquivo de configuração das fontes do firefox
mkdir ~/.config/fontconfig

# Copia o arquivo de configuração
cp fonts.conf ~/.config/fontconfig/fonts.conf

# atualiza o cache
fc-cache -fv