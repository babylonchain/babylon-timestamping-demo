DOCKER := $(shell which docker)
GIT_TOPLEVEL := $(shell git rev-parse --show-toplevel)

build-bitcoindsim:
	$(MAKE) -C $(GIT_TOPLEVEL)/contrib/images bitcoindsim

build-babylond:
	$(DOCKER) build -f $(GIT_TOPLEVEL)/external/babylon/contrib/images/babylond/Dockerfile -t babylonchain/babylond:local $(GIT_TOPLEVEL)/external/babylon

pull-babylond: build-babylond
	
build-vigilante:
	cd $(GIT_TOPLEVEL)/external/vigilante && docker build -t babylonchain/vigilante:local .
	docker tag babylonchain/vigilante:local babylonchain/vigilante:latest

pull-vigilante: build-vigilante

build-deployment-timestamping-bitcoind: pull-babylond build-bitcoindsim pull-vigilante

start-deployment-timestamping-bitcoind: stop-deployment-timestamping-bitcoind build-deployment-timestamping-bitcoind
	./pre-deployment.sh
	docker compose -f artifacts/docker-compose.yml up -d
	./post-deployment.sh

stop-deployment-timestamping-bitcoind:
	docker compose -f artifacts/docker-compose.yml down
	rm -rf $(CURDIR)/.testnets
