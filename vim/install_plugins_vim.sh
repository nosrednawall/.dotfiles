#!/bin/bash
PATH_PADRAO="$(pwd)"
#primeiro instala o vim
sudo apt install vim git 7z python3-pip
sudo pip3 install flake8 pylint
sudo pip3 install jedi-language-server
sudo npm install -g eslint

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
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/preservim/nerdcommenter
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/dense-analysis/ale
git clone https://github.com/sheerun/vim-polyglot

mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -

# For coc-java
# mkdir -p ~/.vim/pack/coc/java
#cd ../java
#wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz

cd $PATH_PADRAO
ln -s coc.nvimrc ~/.vim/coc.nvimrc

# Faz link sinbolico do vimrc
ln -s vimrc ~/.vimrc

# Instala a font usada
mkdir -p /home/$USER/.local/share/fonts
cd /home/$USER/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip
7z e FantasqueSansMono.zip
fc-cache

# Instale as extencoes de linguagens que eu uso
# Abra o VIM
# E Digite o comando abaixo
:CocInstall coc-tsserver coc-json coc-html coc-css coc-python coc-jedi coc-sh coc-snippets coc-git coc-java 

