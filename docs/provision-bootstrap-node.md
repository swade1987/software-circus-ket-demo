# Provisioning up the bootstrap node

The following provides the necessary steps required to provision the bootstrap node:

## Prerequisites

```
$ apt-get install git
$ git clone https://github.com/swade1987/kismatic-packet-demo.git
$ cd kismatic-packet-demo
$ make provision-bootstrap-node
$ source ~/.profile
$ go get -u github.com/ebsarr/packet
```

## 1. Setup Packet CLI profile

You can locate the API Key required for the profile by clicking the [here](https://app.packet.net/portal#/api-keys).

Once obtained, execute the following command and paste in the necessary values.

```
$ packet admin add-profile
```

## 2. Cluster creation

To create the kubernetes cluster follow the steps [here](cluster-creation.md)