DEMO_NAME = software-circus
TEST="Kismatic Env 1"

get-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/provision
	chmod +x provision

create-packet-project:
	packet admin create-project --name "$(DEMO_NAME) demo"

generate-ssh-keypair:
	ssh-keygen -t rsa -f $(DEMO_NAME).pem -N ""

upload-packet-ssh-key:
	packet admin create-sshkey --label $(DEMO_NAME) --file $(DEMO_NAME).pem.pub

get-packet-projects:
	export NAME=$(TEST) && packet admin list-projects | jq '.[] | select(.name=="'"${NAME}"'")'

get-packet-api-key:
	packet admin list-profiles | grep ^default | awk '{ print $$2 }'

get-ssh-keys:
	packet admin list-sshkeys

create-infrastructure:
	./provision packet create -e 3 -m 2 -w 5 --region eu-west

provision-cluster:
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .

add-worker-node:
	packet baremetal create-device \
	--facility ams1 \
	--hostname worker-01 \
	--os-type ubuntu_16_04 \
	--project-id $PACKET_PROJECT_ID

clean:
	rm -rf ansible cfssl generated runs kismatic kismatic-cluster.yaml kubeconfig provision 100apis/software-circus
	rm -rf *.pem *.pem.pub