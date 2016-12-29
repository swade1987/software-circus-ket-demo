DEMO_NAME = software-circus
ADDITIONAL_WORKER_NODE_NAME = worker-06
ADDITIONAL_WORKER_NODE_IP =

get-darwin-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest-darwin/provision
	chmod +x provision

get-linux-dependencies:
	wget -O - https://kismatic-installer.s3-accelerate.amazonaws.com/latest/kismatic.tar.gz | tar -zx
	wget -O provision https://kismatic-installer.s3-accelerate.amazonaws.com/latest/provision
	chmod +x provision

create-packet-project:
	packet admin create-project --name "$(DEMO_NAME)"

generate-ssh-keypair:
	ssh-keygen -t rsa -f $(DEMO_NAME).pem -N ""

upload-packet-ssh-key:
	packet admin create-sshkey --label $(DEMO_NAME) --file $(DEMO_NAME).pem.pub

get-packet-project-id:
	export NAME=$(DEMO_NAME) && packet admin list-projects | jq -r '.[] | select(.name=="'"${NAME}"'") | .id '

get-packet-api-key:
	packet admin list-profiles | grep ^default | awk '{ print $$2 }'

create-infrastructure:
	./provision packet create -e 3 -m 2 -w 5 --region us-east

provision-cluster:
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .

create-packet-new-worker-node:
	packet baremetal create-device \
	--facility ewr1 \
	--hostname $(ADDITIONAL_WORKER_NODE_NAME) \
	--os-type ubuntu_16_04 \
	--project-id $$PACKET_PROJECT_ID

create-bootstrap-node:
	packet baremetal create-device \
	--facility ewr1 \
	--hostname bootstrap-node \
	--os-type ubuntu_16_04 \
	--project-id $$PACKET_PROJECT_ID

add-worker-node-to-cluster:
	./kismatic install add-worker $(ADDITIONAL_WORKER_NODE_NAME) $(ADDITIONAL_WORKER_NODE_IP)

clean:
	rm -rf ansible cfssl generated runs kismatic kismatic-cluster.yaml kubeconfig provision 100apis/software-circus