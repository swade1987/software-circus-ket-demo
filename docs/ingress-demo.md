# Ingress Demo

Note: This demo uses the [Hello World Kubernetes](https://github.com/swade1987/hello-world-kubernetes) application.

To demo Ingress please execute the following from the **bootstrap** node:

# Prerequisites

To enable this to work I had to create a DNS record for `hello-world.stevenwade.co.uk` and point it to our Ingress node.

## 1. Deploy the Hello World Kubernetes application

```
$ make deploy-hello-world-app
```

## 2. See it in action

Now browse to [http://hello-world.stevenwade.co.uk](http://hello-world.stevenwade.co.uk)

If you refresh you should see the following values changing:

1. HOSTNAME
2. MY_POD_NAME
3. MY_POD_IP