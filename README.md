# Software Circus KET Demo
A repository for my Kismatic Enterprise Toolkit (KET) demo at Software Circus Amsterdam (10th Jan 2017).

The repository uses [Packet.net](https://www.packet.net/) to provide the underlying infrastructure.

After provisioning the cluster 100 apis will be created and deployed in a matter of seconds.

# Prerequisites
To use this solution, the following Packet CLI needs to be installed [https://github.com/ebsarr/packet](https://github.com/ebsarr/packet)

Follow the `README.md` for the project to guide you through the installation process.

**IMPORTANT:** You need to create a default profile for the Packet CLI using the command below to use this project:

```
$ packet admin add-profile
```

Additionally we need to obtain the binaries for the following two projects:

1. [Kismatic Enterprise Toolkit](https://github.com/apprenda/kismatic)

2. [Kismatic Provision](https://github.com/apprenda/kismatic-provision)

To make this possible execute the following command:
```
$ make get-dependencies
```

# Usage

## 1. Create a new project
```
$ make create-packet-project
```

## 2. Generate and upload SSH key to packet.net
Execute the following commands in order:

```
$ make generate-ssh-keypair
$ make upload-packet-ssh-key
```

## 3. Obtain Project ID and API key.
```
$ make get-packet-projects
$ make get-packet-profiles
```

## 4. Create infrastructure
Execute the following commands in order:

```
$ export PACKET_API_KEY=
$ export PACKET_PROJECT_ID=
$ export PACKET_SSH_KEY_PATH=./software-circus.pem
$ make create-infrastructure
```

## 5. Tweak the kismatic-cluster.yaml
The following line in the YAML file

```
ssh_key: ./software-circus.pem
```

needs to be changed to be the **full** path, something like

```
ssh_key: /Users/StevenWade/projects/github/swade1987/software-circus-ket-demo/software-circus.pem
```

## 6. Provision infrastructure using KET
```
$ make provision-cluster
```

## 7. Setup Weave Cloud
Browse to [https://cloud.weave.works](https://cloud.weave.works) create a new instance and locate your token and execute
```
$ kubectl apply --kubeconfig kubeconfig \
-f 'https://cloud.weave.works/launch/k8s/weavescope.yaml?service-token=<token>'
```

## 8. Create 100 APIs
```
$ make create-100-apis
```

## 9. Deploy the 100 APIs
```
$ make deploy-100-apis
```

# Useful commands

## Delete project
```
$ packet admin delete-project --project-id ""
```

## Delete SSH key
```
$ packet admin delete-sshkey --key-id ""
```

## Delete cluster
```
$ PACKET_API_KEY=<api_uuid> \
PACKET_PROJECT_ID=<project_uuid> \
PACKET_SSH_KEY_PATH=<path_to_pem> \
./provision packet delete --all
```

## Clean files and directories
```
$ make clean
```