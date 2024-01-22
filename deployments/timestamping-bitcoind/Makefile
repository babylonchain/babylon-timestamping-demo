DOCKER := $(shell which docker)
GIT_TOPLEVEL := $(shell git rev-parse --show-toplevel)

PUBLIC_IMAGE_REPO := public.ecr.aws/t9e9i3h0

BABYLON_IMAGE_NAME := babylond
BABYLON_IMAGE_TAG  := 234dc8606ab1b8103ccf13ab49d198306d8819ee

VIGILANTE_IMAGE_NAME := vigilante
VIGILANTE_IMAGE_TAG  := e55a13952cacc59751f5c870a9bf4ec24ae425f1

build-bitcoindsim:
	$(MAKE) -C $(GIT_TOPLEVEL)/contrib/images bitcoindsim

build-babylond:
	$(MAKE) -C $(GIT_TOPLEVEL)/babylon-private/contrib/images babylond

pull-babylond:
	docker pull $(PUBLIC_IMAGE_REPO)/$(BABYLON_IMAGE_NAME):$(BABYLON_IMAGE_TAG)
	docker tag $(PUBLIC_IMAGE_REPO)/$(BABYLON_IMAGE_NAME):$(BABYLON_IMAGE_TAG) babylonchain/$(BABYLON_IMAGE_NAME):latest

build-vigilante:
	$(MAKE) -C $(GIT_TOPLEVEL)/vigilante-private BBN_PRIV_DEPLOY_KEY=${BBN_PRIV_DEPLOY_KEY} build-docker

pull-vigilante:
	docker pull $(PUBLIC_IMAGE_REPO)/$(VIGILANTE_IMAGE_NAME):$(VIGILANTE_IMAGE_TAG)
	docker tag $(PUBLIC_IMAGE_REPO)/$(VIGILANTE_IMAGE_NAME):$(VIGILANTE_IMAGE_TAG) babylonchain/$(VIGILANTE_IMAGE_NAME):latest

build-deployment-timestamping-bitcoind: pull-babylond build-bitcoindsim pull-vigilante

start-deployment-timestamping-bitcoind: stop-deployment-timestamping-bitcoind build-deployment-timestamping-bitcoind
	./pre-deployment.sh
	docker compose -f artifacts/docker-compose.yml up -d
	./post-deployment.sh

stop-deployment-timestamping-bitcoind:
	docker compose -f artifacts/docker-compose.yml down
	rm -rf $(CURDIR)/.testnets
