#!/usr/bin/env bash
mkdir /tmp/fonts
cd /tmp/fonts
git clone git@github.com:ryanoasis/nerd-fonts.git nerd
cd nerd
chmod +x install.sh
sh install.sh -UA