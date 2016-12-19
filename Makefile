get-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/provision
	chmod +x provision

get-packet-projects:
	packet admin list-projects

get-packet-profiles:
	packet admin list-profiles

get-ssh-keys:
	packet admin list-sshkeys

clear-dependencies:
	rm -rf kismatic provision ansible cfssl

create-packet-project:
	packet admin create-project --name "Software Circus KET Demo" -payment-id ""

upload-packet-ssh-key:
	packet admin create-sshkey --label software-circus --file id_rsa.pub

create-cluster:
	PACKET_API_KEY=<api_uuid> PACKET_PROJECT_ID=<project_uuid> PACKET_SSH_KEY_PATH=<path_to_pem> ./provision packet create