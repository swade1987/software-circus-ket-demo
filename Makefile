get-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/provision
	chmod +x provision

clear-dependencies:
	rm -rf kismatic provision ansible cfssl

add-packet-profile:
	packet admin add-profile

create-packet-project:
	packet admin create-project --name "Software Circus KET Demo" -payment-id ""

upload-packet-ssh-key:
	packet admin create-sshkey --label software-circus --file id_rsa.pub

get-packet-projects:
	packet admin list-projects

get-packet-profiles:
	packet admin list-profiles

delete--packet-project:
	packet admin delete-project --project-id ""
