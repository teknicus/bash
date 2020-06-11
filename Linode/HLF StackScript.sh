#!/bin/bash

apt update
apt -y upgrade
apt -y install git curl wget apt-transport-https ca-certificates curl software-properties-common build-essential
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt-cache policy docker-ce
apt -y install docker-ce docker-compose
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | sh
source ~/.profile
nvm install 12.18.0

curl https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz --output /tmp/go1.12.1.linux-amd64.tar.gz

tar -xvf /tmp/go1.12.1.linux-amd64.tar.gz -C /usr/local
chown -R root:root /usr/local/go

mkdir -p $HOME/go/{bin,src}

touch /root/.profile
echo "export GOPATH=$HOME/go" >> /root/.profile
echo "export PATH=$PATH:$GOPATH/bin" >> /root/.profile
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> /root/.profile
