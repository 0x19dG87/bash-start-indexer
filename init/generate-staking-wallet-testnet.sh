#!/bin/bash

#OPERATOR_WALLET_TESTNET=$(tmpfile=$(mktemp) && echo "$(sed -n 's/^OPERATOR_SEED_PHRASE_TESTNET=//p' .env | sed 's/\"//g')" > "$tmpfile" && \
#			      docker run -v "$tmpfile":/seed.txt node bash -c "npm install -g @ethersproject/cli && ethers --account /seed.txt --rpc https://rpc.ankr.com/eth_goerli info" && rm "$tmpfile"#)

OPERATOR_WALLET_TESTNET=$(tmpfile=$(mktemp) && echo "$1" > "$tmpfile" && \
			      docker run -v "$tmpfile":/seed.txt node bash -c "npm install -g @ethersproject/cli && ethers --account /seed.txt --rpc https://rpc.ankr.com/eth_goerli info" && rm "$tmpfile")

echo "$OPERATOR_WALLET_TESTNET"

OPERATOR_WALLET_ADDRESS_TESTNET=$(echo "$OPERATOR_WALLET_TESTNET" | grep Address: | grep -o -E '0x[a-fA-F0-9]{40}' | tr '[:upper:]' '[:lower:]')
OPERATOR_WALLET_BALANCE_TESTNET=$(echo "$OPERATOR_WALLET_TESTNET" | grep Balance: | grep -o -E '([0-9]+\.[0-9]+)')


STAKING_WALLET_ADDRESS_TESTNET=$(http -b post "https://gateway.testnet.thegraph.com/network" \
				      query="{graphAccount(id: \"$OPERATOR_WALLET_ADDRESS_TESTNET\") {id operatorOf {indexer {account {id}}}}}" | \
				     jq '.data.graphAccount.operatorOf[0].indexer.account.id' | sed 's/\"//g')

echo "Your operator wallet $OPERATOR_WALLET_ADDRESS_TESTNET has a balance of $OPERATOR_WALLET_BALANCE_TESTNET ETH".

if [ 1 -eq "$(echo "${OPERATOR_WALLET_BALANCE_TESTNET} < 0.2" | bc)" ]
then
    echo "Please refill your operator wallet!"
fi

echo "Your staking wallet address is $STAKING_WALLET_ADDRESS_TESTNET."

echo "$STAKING_WALLET_ADDRESS_TESTNET" > staking-wallet-testnet


		   


