MAKEFLAGS += --silent

.PHONY: up import synth deploy status test clean

all: up import synth deploy status test
	echo "Doing all"

up:
	which cdk8s || npm install -g cdk8s-cli
	k3d cluster ls k3s-default || k3d cluster create --config k3d.yaml
	kubectl cluster-info

import:
	pipenv install
	cdk8s import --language python

synth: ## Create k8s manifest
	cdk8s synth
	
deploy:
	kubectl apply -f ./dist/hello.k8s.yaml

status:
	kubectl get svc,po -o wide

test:
	[ -f ./test/test.sh ] && ./test/test.sh

clean:
	echo -n "Are you sure? (Press Enter to continue or Ctrl+C to abort) "
	read _ 
	k3d cluster stop k3s-default
	k3d cluster delete k3s-default
	pipenv clean
	rm -rf ./dist ./imports

-include include.mk
