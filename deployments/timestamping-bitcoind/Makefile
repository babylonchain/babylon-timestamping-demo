DOCKER := $(shell which docker)
GIT_TOPLEVEL := $(shell git rev-parse --show-toplevel)

build-bitcoindsim:
	$(MAKE) -C $(GIT_TOPLEVEL)/contrib/images bitcoindsim

build-babylond:
	$(DOCKER) build -f $(GIT_TOPLEVEL)/external/babylon/contrib/images/babylond/Dockerfile -t babylonlabs-io/babylond:local $(GIT_TOPLEVEL)/external/babylon
	$(DOCKER) tag babylonlabs-io/babylond:local babylonlabs-io/babylond:latest

pull-babylond: build-babylond
	
build-vigilante:
	cd $(GIT_TOPLEVEL)/external/vigilante && docker build -t babylonlabs-io/vigilante:local .
	docker tag babylonlabs-io/vigilante:local babylonlabs-io/vigilante:latest

pull-vigilante: build-vigilante

build-deployment-timestamping-bitcoind: pull-babylond build-bitcoindsim pull-vigilante

start-deployment-timestamping-bitcoind: stop-deployment-timestamping-bitcoind build-deployment-timestamping-bitcoind
	./pre-deployment.sh
	docker compose -f artifacts/docker-compose.yml up -d
	./post-deployment.sh

stop-deployment-timestamping-bitcoind:
	docker compose -f artifacts/docker-compose.yml down
	rm -rf $(CURDIR)/.testnets
