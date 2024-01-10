start-deployment-timestamping-bitcoind:
	$(MAKE) -C $(CURDIR)/deployments/timestamping-bitcoind \
		BBN_PRIV_DEPLOY_KEY=${BBN_PRIV_DEPLOY_KEY} \
		start-deployment-timestamping-bitcoind

stop-deployment-timestamping-bitcoind:
	$(MAKE) -C $(CURDIR)/deployments/timestamping-bitcoind \
		stop-deployment-timestamping-bitcoind
