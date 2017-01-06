
## 1. Local machine

```
$ make create-project
$ make upload-ssh-key
$ export PACKET_PROJECT_ID=$(make get-project-id)
$ make create-bootstrap-node
```

## 2. Bootstrap provision

```
$ apt-get install git
$ git clone https://github.com/swade1987/kismatic-packet-demo.git
$ cd kismatic-packet-demo
$ make provision-bootstrap-node
$ source ~/.profile
$ go get -u github.com/ebsarr/packet
$ packet admin add-profile
```

## 3. Create cluster

```
$ export PACKET_PROJECT_ID=$(make get-project-id)
$ export PACKET_API_KEY=$(make get-api-key)
$ export PACKET_SSH_KEY_PATH=/root/kismatic-packet-demo/software-circus.pem

$ ./provision packet create -e 3 -m 2 -w 3 --region us-east

$ ./kismatic install apply -f kismatic-cluster.yaml

$ cp generated/kubeconfig .
```

## 4. Ingres demo
```
$ make deploy-hello-world-app
```

## 5. Add worker demo
```
$ make create-new-worker-node

$ export NEW_WORKER_NODE_IP_ADDRESS=$(make get-new-worker-node-ip)

$ ./kismatic install add-worker new-worker-node $NEW_WORKER_NODE_IP_ADDRESS

$ ./provision packet list
```