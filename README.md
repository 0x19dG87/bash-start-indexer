START INDEXER (1)
=================

## NAME

```
./start
-bash: ./start: Put your city on the map
```

## SYNOPSIS

```
bash start-indexer [OPTION]... [FILE]...
```

## DESCRIPTION

Run a graph protocol indexer on the decentralized network.

```
-s, --seed
         (TBD) seed phrase for the operator wallet

-t, --testnet
         run on testnet

-m, --mainnet
         run on mainnet

-a, --api-key  
         (TBD) api key to use rpcs from different decentralized rpc networks
```

FINANCIALS
==========

As a result on the low end it’s possible to run indexers profitably at a GRT price of $0.05 with the minimum stake of 100,000 GRT.

The following details daily cost and rewards using $0.05 and $0.10 as scenarios for the price of GRT as the price points where the indexer breaks even and when it pays more rewards than simply delegating.


||GRT|USD|USD|
|-|-:|-:|-:|
|GRT price | 1 | $0.05 | $0.10 |
| self stake | 100000 | $5,000.00 | $10,000.00 |
| delegations max | 1500000 | $75,000.00 | $150,000.00 |
| average rewards per 1 million GRT staked   for the top 50 subgraphs | 298 | $14.90 | $29.80 |
|||||
| max staking rewards at 10% commission | 74.5 | $3.73 | $7.45 |
| delegation rewards at 10% commission | 26.82 | $1.34 | $2.68 |
|||||
| profit before cost | 47.68 | $2.38 | $4.77 |
|||||
|||||
| rpc access | | $3.33 | $3.33 | $3.33 |
| index node | | $0.20 | $0.20 | $0.20 |
|||||
| **profit over delegating** | | $-1.15 | **$1.23** |
|||||
| APR staking | | 1.40% | **14.30%** |
| APR delegating | | 9.79% | 9.79% |


ASSUMPTIONS
===========

* The indexer runs at home at negligible cost of electricity or the cheapest VPS for $6 [Contabo VPS 200 GB SSD](https://contabo.com/de/vps/vps-s-ssd/?image=ubuntu.267&qty=1&contract=1&storage-type=vps-s-200-gb-ssd)
* It’s possible to obtain RPC access at $100 per month [provided by StakeSquid on request per Email](mailto:goldberg@stakesquid.com)
* The indexer can max out it’s delegation capacity... to be done. This will be achieved through participation in a liquid staking pool. Pool operators please contact us.






