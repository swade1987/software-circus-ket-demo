# Software Circus KET Demo
A repo for my Kismatic Enterprise Toolkit (KET) demo at Software Circus Amsterdam (10th Jan 2017)

# Prerequisites
To use this solution, the following Packet CLI needs to be installed [https://github.com/ebsarr/packet](https://github.com/ebsarr/packet)

Follow the `README.md` for the project to guide you through the installation process.

**IMPORTANT:** You need to create a default profile for the Packet CLI using the command below to use this project:

```
$ packet admin add-profile
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

## Obtain API key
```
$ make get-packet-profiles
```

## Upload SSH key
This assumes you have a `id_rsa.pub` key the current directory!
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