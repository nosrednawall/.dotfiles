#!/bin/bash

#primeiro instala o vim
sudo apt install vim git 7z

# Cria as pastas
mkdir -p ~/.vim/pack/git-plugins/start
cd $HOME/.vim/pack/git-plugins/start

# Realiza o clone dos plugins
git clone https://github.com/preservim/nerdtree
git clone https://github.com/Yggdroot/indentLine
git clone https://github.com/tomasiser/vim-code-dark
git clone https://github.com/rafi/awesome-vim-colorschemes
git clone https://github.com/mhinz/vim-startify
git clone https://github.com/ryanoasis/vim-devicons


# Faz link sinbolico do vimrc
ln -s vimrc ~/.vimrc

# Instala a font usada
mkdir -p ~/.fonts
cd ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete%20Mono.otf
fc-cache
# Passos para JetBrainsMono
#wget https://download.jetbrains.com/fonts/JetBrainsMono-1.0.0.zip
#7z e JetBrainsMono-1.0.0.zip
#rm JetBrainsMono-1.0.0.zip
#fc-cache
