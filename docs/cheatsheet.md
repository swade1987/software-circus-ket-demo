
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
$ chmod 600 software-circus.pem

$ ./provision packet create -e 3 -m 2 -w 3 --region us-east
$ time ./kismatic install step _packages.yaml
$ sed -i "/\b\(internalip\)\b/d" kismatic-cluster.yaml
```

## 4. Provision cluster

```
$ time ./kismatic install apply -f kismatic-cluster.yaml

$ cp generated/kubeconfig .
```

## 5. Ingress demo
```
$ make deploy-hello-world-app
```

## 6. Add worker demo
```
$ make create-new-worker-node

$ export NEW_WORKER_NODE_IP_ADDRESS=$(make get-new-worker-node-ip)

$ time ./kismatic install add-worker new-worker-node $NEW_WORKER_NODE_IP_ADDRESS

$ ./provision packet list
```