# Local machine setup

The following provides the necessary steps required to setup your local machine:

# Prerequisites

To use this solution, the following Packet CLI needs to be installed [https://github.com/ebsarr/packet](https://github.com/ebsarr/packet)

Make sure you have Golang installed and configured and then execute the commands below:

```
$ go get -u github.com/ebsarr/packet
```

# Usage

## 1. Setup Packet CLI profile

You can locate the API Key required for the profile by clicking the [here](https://app.packet.net/portal#/api-keys).

Once obtained, execute the following command and paste in the necessary values.

```
$ packet admin add-profile
```

## 2. Create a new project
```
$ make create-project
```

## 3. Upload the SSH key to packet.net
```
$ make upload-ssh-key
```

## 4. Set the Packet Project ID environment variable
```
$ export PACKET_PROJECT_ID=$(make get-project-id)
```

## 5. Create a bootstrap node on packet.net
```
$ make create-bootstrap-node
```

To provision the newly created bootstrap node follow the steps [here](provision-bootstrap-node.md)