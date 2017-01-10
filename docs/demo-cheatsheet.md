## Create the cluster infrastructure

```
$ ./provision packet create -e 3 -m 2 -w 3 --region us-east
```

## Provision the cluster with KET

```
$ time ./kismatic install apply -f kismatic-cluster.yaml
$ cp generated/kubeconfig .
```

## Ingress demo
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