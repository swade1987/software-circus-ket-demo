# Cluster creation

To create and provision the cluster execute the following from the **bootstrap** node:

## 1. Set the necessary environment variables

Execute the following commands to set the necessary environment variables:

```
$ export PACKET_PROJECT_ID=$(make get-project-id)
$ export PACKET_API_KEY=$(make get-api-key)
$ export PACKET_SSH_KEY_PATH=/root/kismatic-packet-demo/software-circus.pem
```

## 2. Create the infrastructure on packet.net
```
$ make create-infrastructure
```

## 3. Provision infrastructure using KET
```
$ make provision-cluster
```