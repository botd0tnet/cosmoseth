#!/bin/bash

for(( i=1; i <=55; i++ ))
do
	txhash=$(echo 1234jqka12 | umeed tx peggy send-to-eth 0xBaba0eA6D8B8D9CD19f6F1AeD2cDB76888D273D4 10uumee 1uumee --from BotDotNet --chain-id umee-alpha-mainnet-2 -y | jq -r .txhash)
	sleep 5
	echo $txhash >> /root/costoeth_tx.txt
	printf "%b\n" "$txhash"
	sleep 60
done

printf "%b\n\n\n" "-------"
printf "%b\n" "DONE ! "
printf "%b\n\n\n"
printf "%b\n\n\n" "-------"

sleep 15

while read -r p;
do
	printf "%s\n" "$p" >> /root/costoeth_raw.txt
	printf '%s\n' "" >> /root/costoeth_raw.txt
	echo $(umeed q tx $p | grep raw_log) >> /root/costoeth_raw.txt
	printf '%s\n' "---" >> /root/costoeth_raw.txt
	sleep 10
done </root/costoeth_tx.txt
