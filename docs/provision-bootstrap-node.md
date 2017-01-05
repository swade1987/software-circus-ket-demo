# Provisioning up the bootstrap node

The following provides the necessary steps required to provision the bootstrap node:

## Prerequisites

```
$ git clone https://github.com/swade1987/kismatic-packet-demo.git
$ cd kismatic-packet-demo
$ make provision-bootstrap-node
```

## 1. Setup Packet CLI profile

You can locate the [API Key](https://app.packet.net/portal#/api-keys) required for the profile by clicking the links in this text.

Once obtained, execute the following command and paste in the necessary values.

```
$ packet admin add-profile
```

## 2. Cluster creation

To create the kubernetes cluster follow the steps [here](cluster-creation.md)