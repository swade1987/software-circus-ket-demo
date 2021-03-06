#!/bin/sh
echo "Provisioning boostrap machine ..."

echo "Installing necessary packages ..."
apt-get update -y
apt-get upgrade -y
sudo apt-get install build-essential jq git -y

echo "Installing Kubectl ..."
wget https://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

echo "Installing Golang ..."
curl -O https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
tar xvf go1.7.4.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

echo "Updating GOPATH ..."
echo 'export GOPATH=$HOME/work' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile