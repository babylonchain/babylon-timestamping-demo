# Babylon Timestamping Demo

This repository contains all the necessary artifacts and instructions to set up
and run a Babylon network locally, for a BTC timestamping demo scenario.

This repository is based on and adapted from the `babylon-deployment` repository.

**A detailed blog post has been crafted to shed light on Babylon's innovative use of the Bitcoin time-stamping protocol, enhancing Blockchain security and data integrity. This exploration delves into the mechanisms Babylon employs to integrate with Bitcoin, offering a unique perspective on blockchain technology's future.**

*Read the full article [here](https://ali-the-curious.medium.com/embracing-the-future-with-babylon-f2fa84da4dee) for a deeper understanding.*

## Prerequisites

1. Install Docker Desktop

    All components are executed as Docker containers on the local machine, so a
    local Docker installation is required. Depending on your operating system,
    you can find relevant instructions [here](https://docs.docker.com/desktop/).

2. Install `make`

    Required to build the service binaries. One tutorial that can be followed
    is [this](https://sp21.datastructur.es/materials/guides/make-install.html).

4. Clone the repository

    The aforementioned components are included in the repo as git submodules, so
    they need to be initialized accordingly.

    ```shell
    git clone git@github.com:babylonchain/babylon-timestamping-demo.git
    ```

## Deployment scenarios

The deployment scenarios live under the [deployments](deployments/) directory,
on a dedicated subdirectory.  The following scenarios are currently available:

- [BTC Timestamping (BTC backend: bitcoind)](deployments/timestamping-bitcoind):
  Spawns a Babylon network featuring Babylon's BTC Timestamping protocol,
  backed by a bitcoind-based BTC simnet using `bitcoindsim`.

### Subdirectory structure and deployment process

Each deployment scenario subdirectory follows the structure indicated below:

```shell
├── artifacts
│   ├── docker-compose.yml
│   ├── ...
├── Makefile
├── post-deployment.sh
└── pre-deployment.sh
```

### BTC Timestamping (BTC backend: bitcoind)

To start the network:

```shell
make start-deployment-timestamping-bitcoind
```

To stop the network:

```shell
make stop-deployment-timestamping-bitcoind
```
