MAKEFLAGS += --silent

.PHONY: up down deploy status test

up:
	which cdk8s || scripts/install.sh
	k3d cluster ls k3s-default || k3d cluster create --config k3d.yaml

down:
	echo -n "Are you sure? (ctrl+C to abort) "
	read _ 
	k3d cluster stop k3s-default
	k3d cluster delete k3s-default

deploy:
	cdk8s synth
	kubectl apply -f ./dist/hello.k8s.yaml

status:
	kubectl get svc,po

test:
	[ -f ./test/test.sh ] && ./test/test.sh

-include include.mk
