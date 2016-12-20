DEMO_NAME = software-circus

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

create-100-apis:
	cd 100apis && go build && ./100apis -n=100 -m=2 -d=$(DEMO_NAME)

deploy-100-apis:
	kubectl create --kubeconfig kubeconfig -f 100apis/software-circus

delete-100-apis:
	kubectl delete --kubeconfig kubeconfig -f 100apis/software-circus

clean:
	rm -rf ansible cfssl generated runs kismatic kismatic-cluster.yaml kubeconfig provision 100apis/software-circus
	rm -rf *.pem *.pem.pub