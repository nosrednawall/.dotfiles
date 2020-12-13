#!/bin/sh

sudo apt-get update
sudo apt-get install build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
bash
nvm ls-remote
nvm install v10.16.0
npm i npm -g