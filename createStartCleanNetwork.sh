#!/bin/bash
# delete old block chain
echo '*********************** delete old database ***********************'
rm -rf ~/.ethereum/net42 
rm -rf ~/.ethereum/ethash
# Run this once, but it does not hurt to run it every time
echo '*********************** initialize net42 ***********************'
geth --datadir ~/.ethereum/net42 init ./genesis42.json
# Run this every time you start your Geth "42", and add flags here as you need
echo '*********************** run geth ***********************'
nice -50 geth --datadir ~/.ethereum/net42 --networkid 42 --nodiscover console --preload createAccounts.js --rpc --rpcport 8545 --rpcaddr 0.0.0.0 --rpccorsdomain "*" --rpcapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3"
