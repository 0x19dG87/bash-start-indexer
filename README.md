INTO
=================
The purpose of this repo is to quickly create and run __Graph Indexers__ in both mainnet and testnet. It supports running Indexers for different networks. The repo is a fork of https://github.com/StakeSquid/bash-start-indexer which was originally designed by StakeSquid team.
### NOTES
Running Indexers for both mainnet and testnet on the same machine is dangerous. Please, be attentive while doing some changes. We are not responsible for any issues that might happen.

START INDEXER
=================
### SYNOPSIS
```
./start or bash start [DOCKER OPTIONS]
```
> This will start indexer on both mainnet and testnet. Follow CLI instuctions to create .env file.
```
.start-indexer or bash start-indexer [OPTIONS] [DOCKER OPTIONS]
```
> This will start indexer based on the option parameters

### DESCRIPTION
Run a graph protocol indexer on the decentralized network.
```
[OPTIONS]
-t, --testnet
         run on testnet

-m, --mainnet
         run on mainnet

[DOCKER OPTIONS]
--force-recreate
```

STOP INDEXER
==========
### SYNOPSIS
```
./stop or bash stop [DOCKER OPTIONS]
```
> This will stop all indexer's containers.