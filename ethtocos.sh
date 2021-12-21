#!/bin/bash

ETH_PK_CLEAN="657ad2b96e....."
ETH_RPC="https://goerli-light.nodes.guru"

for(( i=1; i <=55; i++ ))
do
  peggo bridge send-to-cosmos 0xe54fbaecc50731afe54924c40dfd1274f718fe02 umee1sg2vam988aqenkrkdk3er0huuzyupejz8a6j20 10 --eth-pk=$ETH_PK_CLEAN --eth-rpc=$ETH_RPC
  sleep 60
done
