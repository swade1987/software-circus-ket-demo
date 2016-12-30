# Local machine setup

The following provides the necessary steps required to setup your local machine:

# Prerequisites

To use this solution, the following Packet CLI needs to be installed [https://github.com/ebsarr/packet](https://github.com/ebsarr/packet)

Make sure you have Golang installed and configured and then execute the commands below:

```
$ go get -u github.com/ebsarr/packet
$ packet admin add-profile
```

Additionally we need to obtain the binaries for the following two projects:

1. [Kismatic Enterprise Toolkit](https://github.com/apprenda/kismatic)

2. [Kismatic Provision](https://github.com/apprenda/kismatic-provision)

To make this possible execute the following command:
```
$ make get-darwin-dependencies
```

# Usage

## 1. Create a new project
```
$ make create-packet-project
```

## 2. Upload the SSH key to packet.net
```
$ make upload-packet-ssh-key
```

## 3. Obtain the Project ID from packet.net.
```
$ make get-packet-project-id
```

## 4. Create a bootstrap node on packet.net
Set the `PACKET_PROJECT_ID` environment variable from the command execute above then execute:
```
$ export PACKET_PROJECT_ID=
$ make create-bootstrap-node
```

To provision the newly created bootstrap node follow the steps [here](provision-bootstrap-node.md)