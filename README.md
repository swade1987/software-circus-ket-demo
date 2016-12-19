# Software Circus KET Demo
A repo for my Kismatic Enterprise Toolkit (KET) demo at Software Circus Amsterdam (10th Jan 2017).
The repository uses [Packet.net](https://www.packet.net/) to create the Kubernetes cluster.

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

## Create new project
```
$ make create-packet-project
```

## List projects
```
$ make get-packet-projects
```

## Obtain API Keys
```
$ make get-packet-profiles
```

## Obtain SSH Keys
```
$ make get-ssh-keys
```

## Upload SSH key
This assumes you have a `id_rsa.pub` key in the current directory!
```
$ make upload-packet-ssh-key
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