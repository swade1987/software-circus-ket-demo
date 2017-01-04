DEMO_NAME = software-circus
ADDITIONAL_WORKER_NODE_NAME = new-worker-node
ADDITIONAL_WORKER_NODE_IP =

get-linux-dependencies:
	wget -O - https://github.com/apprenda/kismatic/releases/download/v1.1.0/kismatic-v1.1.0-linux-amd64.tar.gz | tar -zx
	wget -O provision https://github.com/apprenda/kismatic-provision/releases/download/v1.0/provision-linux-amd64
	chmod +x provision

create-packet-project:
	packet admin create-project --name "$(DEMO_NAME)"

upload-packet-ssh-key:
	packet admin create-sshkey --label $(DEMO_NAME) --file $(DEMO_NAME).pem.pub

get-packet-project-id:
	packet admin list-profiles | grep ^default | awk '{ print $$3 }'

get-packet-api-key:
	packet admin list-profiles | grep ^default | awk '{ print $$2 }'

create-infrastructure:
	chmod 600 $(DEMO_NAME).pem
	./provision packet create -e 3 -m 2 -w 5 --region us-east
	sed -i "/\b\(internalip\)\b/d" kismatic-cluster.yaml

provision-cluster:
	./kismatic install apply -f kismatic-cluster.yaml
	cp generated/kubeconfig .

create-new-worker-node:
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

get-new-worker-node-ip:
	packet baremetal list-devices --project-id $$PACKET_PROJECT_ID |jq '.[] | select(.hostname == "new-worker-node") | .ip_addresses[] | select(.address_family == 4 and .public == true) | .address'

add-worker-node-to-cluster:
	./kismatic install add-worker $(ADDITIONAL_WORKER_NODE_NAME) $(ADDITIONAL_WORKER_NODE_IP)

get-nodes:
	kubectl --kubeconfig kubeconfig get nodes

clean:
	rm -rf ansible cfssl generated runs kismatic kismatic-cluster.yaml kubeconfig provision