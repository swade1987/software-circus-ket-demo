# Cluster creation

To create and provision the cluster execute the following from the **bootstrap** node:

## 1. Create the infrastructure on packet.net

Obtain the project id and set the necessary environment variable:

```
$ make get-packet-project-id
$ export PACKET_PROJECT_ID=
```

Obtain the api key and set the necessary environment variable:

```
$ make get-packet-api-key
$ export PACKET_API_KEY=
```

Finally set the SSH key location and create the infrastructure
```
$ export PACKET_SSH_KEY_PATH=./software-circus.pem
$ make create-infrastructure
```

## 2. Tweak the kismatic-cluster.yaml
The following line in the YAML file

```
ssh_key: ./software-circus.pem
```

needs to be changed to be the **full** path, something like

```
ssh_key: /Users/StevenWade/projects/github/swade1987/software-circus-ket-demo/software-circus.pem
```

## 3. Provision infrastructure using KET
```
$ make provision-cluster
```