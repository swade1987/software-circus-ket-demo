# Cluster creation

To create and provision the cluster execute the following from the **bootstrap** node:

## 1. Set the necessary environment variables

Execute the following commands to obtain the API Key and Project id

```
$ make get-packet-project-id
$ make get-packet-api-key
```

Now using the results of the commands above set the following environment variables:

```
$ export PACKET_PROJECT_ID=
$ export PACKET_API_KEY=
$ export PACKET_SSH_KEY_PATH=/root/software-circus-ket-demo/software-circus.pem
```

## 2. Create the infrastructure on packet.net
```
$ make create-infrastructure
```

## 3. Provision infrastructure using KET
```
$ make provision-cluster
```