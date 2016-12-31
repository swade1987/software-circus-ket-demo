# Provisioning up the bootstrap node

The following provides the necessary steps required to provision the bootstrap node:

## Prerequisites

```
$ rm ~/.ssh/known_hosts
$ chmod 600 software-circus.pem
$ ssh -i software-circus.pem root@<public ip address>
$ apt-get update
$ apt-get upgrade
$ sudo apt-get install build-essential
$ sudo apt-get install jq
$ sudo apt-get install git
```

## 1. Install Golang

```
$ curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
$ tar xvf go1.6.linux-amd64.tar.gz
$ sudo chown -R root:root ./go
$ sudo mv go /usr/local
```

## 2. Installation Kubectl

```
$ wget https://storage.googleapis.com/kubernetes-release/release/v1.4.4/bin/linux/amd64/kubectl
$ chmod +x kubectl
$ mv kubectl /usr/local/bin/kubectl
```

## 3. Configure Golang

Open the profile file using the command below:

```
$ sudo nano ~/.profile
```

Add the following lines to the file

```
export GOPATH=$HOME/work
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

Finally reload your profile:

```
$ source ~/.profile
```

## 4. Download and install the Packet CLI

```
$ go get -u github.com/ebsarr/packet
$ packet admin add-profile
```

## 5. Clone this directory

```
$ git clone https://github.com/swade1987/software-circus-ket-demo.git
```

## 6. Download the necessary dependencies for this demo

```
$ cd software-circus-ket-demo
$ make get-linux-dependencies
```

## 7. Cluster creation

To created the kubernetes cluster follow the steps [here](cluster-creation.md)