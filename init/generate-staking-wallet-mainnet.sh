#!/bin/bash

#OPERATOR_WALLET_MAINNET=$(tmpfile=$(mktemp) && echo "$(sed -n 's/^OPERATOR_SEED_PHRASE_MAINNET=//p' .env | sed 's/\"//g')" > "$tmpfile" && \
#			      docker run -v "$tmpfile":/seed.txt node bash -c "npm install -g @ethersproject/cli && ethers --account /seed.txt --rpc https://rpc.ankr.com/eth info" && rm "$tmpfile")

OPERATOR_WALLET_MAINNET=$(tmpfile=$(mktemp) && echo "$1" > "$tmpfile" && \
			      docker run -v "$tmpfile":/seed.txt node:alpine /bin/sh -c "npm install -g @ethersproject/cli && ethers --account /seed.txt --rpc https://rpc.ankr.com/eth info" && rm "$tmpfile")

OPERATOR_WALLET_ADDRESS_MAINNET=$(echo "$OPERATOR_WALLET_MAINNET" | grep Address: | grep -o -E '0x[a-fA-F0-9]{40}' | tr '[:upper:]' '[:lower:]')
OPERATOR_WALLET_BALANCE_MAINNET=$(echo "$OPERATOR_WALLET_MAINNET" | grep Balance: | grep -o -E '([0-9]+\.[0-9]+)')

if [ -z "$OPERATOR_WALLET_ADDRESS_MAINNET" ]
then
	echo "No opperator wallet found. Wrong seed phrase." 1>&2
	exit 64
fi

#QUERY="{graphAccount(id: \"$OPERATOR_WALLET_ADDRESS_MAINNET\") {id operatorOf {indexer {account {id}}}}}"

#mainnet_networks=$(http -b post "https://api.thegraph.com/subgraphs/name/graphprotocol/graph-network-mainnet" query="$QUERY")

STAKING_WALLET_ADDRESS_MAINNET=$(http -b post "https://gateway.thegraph.com/network" \
				      query="{graphAccount(id: \"$OPERATOR_WALLET_ADDRESS_MAINNET\") {id operatorOf {indexer {account {id}}}}}" | \
				     jq '.data.graphAccount.operatorOf[0].indexer.account.id' | sed 's/\"//g')

echo "Your operator wallet $OPERATOR_WALLET_ADDRESS_MAINNET has a balance of $OPERATOR_WALLET_BALANCE_MAINNET ETH".

if [ 1 -eq "$(echo "${OPERATOR_WALLET_BALANCE_MAINNET} < 0.2" | bc)" ]
then
    echo "Please refill your operator wallet!"
fi

if [ -z "$STAKING_WALLET_ADDRESS_MAINNET" ]
then
	echo -e "\e[1;32m Please enter your staking wallet address for mainnet: \e[0m"
    read STAKING_WALLET_ADDRESS_MAINNET
else
	echo "Your staking wallet address is $STAKING_WALLET_ADDRESS_MAINNET."
fi

echo "$STAKING_WALLET_ADDRESS_MAINNET" > staking-wallet-mainnet


		   


