# Adding a worker node

To add a new worker node to the cluster execute the following from the **bootstrap** node:

## 1. Create a new node on packet.net

```
$ make create-new-worker-node
```

## 2. Obtain the public IP address for the newly created node and set the environment variable

```
$ export NEW_WORKER_NODE_IP_ADDRESS=$(make get-new-worker-node-ip)
```

## 4. Add the new node to the cluster

```
$ make add-worker-node-to-cluster
```

## 5. Show the newly attached node in the cluster

```
$ make get-nodes
```

You should see `new-worker-node` listed.