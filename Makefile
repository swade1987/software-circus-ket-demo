get-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/provision
	chmod +x provision

create-packet-project:
	packet admin create-project --name "Software Circus KET Demo"

generate-ssh-keypair:
	ssh-keygen -t rsa -f software-circus.pem -N ""

upload-packet-ssh-key:
	packet admin create-sshkey --label software-circus --file software-circus.pem.pub

get-packet-projects:
	packet admin list-projects

get-packet-profiles:
	packet admin list-profiles

get-ssh-keys:
	packet admin list-sshkeys

create-infrastructure:
	./provision packet create -e 3 -m 2 -w 5

provision-cluster:
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .