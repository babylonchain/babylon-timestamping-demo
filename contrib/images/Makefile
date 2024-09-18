all: bitcoindsim

bitcoindsim:
	docker build --platform "linux/amd64" --tag babylonlabs-io/bitcoindsim -f bitcoindsim/Dockerfile \
		$(shell git rev-parse --show-toplevel)/contrib/images/bitcoindsim

bitcoindsim-rmi:
	docker rmi babylonlabs-io/bitcoindsim 2>/dev/null; true

.PHONY: all bitcoindsim bitcoindsim-rmi
