#!/bin/bash
# new

#remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# install dependencies
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Install key docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Install the Repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

#Install the docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

#Run the test
sudo docker run hello-world

# install the docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version

# fail run docker-compose up -d
sudo usermod -aG docker $USER
sudo chmod 755 -R .
#Restart your computer.
sudo shutdown -r now

# try now the tutorial https://rocket.chat/docs/installation/docker-containers/

#old
#----------------------------------------------------------------------------
sudo su -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update

sudo apt-get install -y mongodb-org

sudo systemctl enable --now mongod

sudo apt-get -y update && sudo apt-get install -y curl && curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install -y build-essential mongodb-org nodejs graphicsmagick
sudo npm install -g inherits n && sudo n 8.11.4
#rocketchat
curl -L https://releases.rocket.chat/latest/download -o /tmp/rocket.chat.tgz
tar -xzf /tmp/rocket.chat.tgz -C /tmp
cd /tmp/bundle/programs/server && npm install
sudo mv /tmp/bundle /opt/Rocket.Chat

# Configurar service
sudo useradd -M rocketchat && sudo usermod -L rocketchat

sudo chown -R rocketchat:rocketchat /opt/Rocket.Chat
cat << EOF |sudo tee -a /lib/systemd/system/rocketchat.service
[Unit]
Description=The Rocket.Chat server
After=network.target remote-fs.target nss-lookup.target nginx.target mongod.target
[Service]
ExecStart=/usr/local/bin/node /opt/Rocket.Chat/main.js
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=rocketchat
User=rocketchat
Environment=MONGO_URL=mongodb://localhost:27017/rocketchat?replicaSet=rs01 MONGO_OPLOG_URL=mongodb://localhost:27017/local?replicaSet=rs01 ROOT_URL=http://localhost:3000/ PORT=3000
[Install]
WantedBy=multi-user.target
EOF

sudo sed -i "s/^#  engine:/  engine: mmapv1/"  /etc/mongod.conf
sudo sed -i "s/^#replication:/replication:\n  replSetName: rs01/" /etc/mongod.conf
sudo systemctl enable mongod && sudo systemctl start mongod
mongo --eval "printjson(rs.initiate())"
sudo mkdir -p /var/lib/mongodb/data/db

sudo systemctl enable rocketchat && sudo systemctl start rocketchat

# Caso dê erro acesse https://askubuntu.com/questions/884541/cant-start-mongodb-service

#echo "[Unit]
#Description=High-performance, schema-free document-oriented >database
#After=network.target

#[Service]
#User=mongodb
#ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

#[Install]
#WantedBy=multi-user.target"

# interacao com o usuoario
#echo "Informe \"n\" para notebook ou \"d\" para desktop";
#read ESCOLHA;

#echo "mongodb-org hold" | sudo dpkg --set-selections
#echo "mongodb-org-server hold" | sudo dpkg --set-selections
#echo "mongodb-org-shell hold" | sudo dpkg --set-selections
#echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
#echo "mongodb-org-tools hold" | sudo dpkg --set-selections
