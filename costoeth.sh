#!/bin/bash

for(( i=1; i <=2; i++ ))
do
	echo $(echo 1234jqka12 | umeed tx peggy send-to-eth 0xBaba0eA6D8B8D9CD19f6F1AeD2cDB76888D273D4 10uumee 1uumee --from BotDotNet --chain-id umee-alpha-mainnet-2 -y | grep txhash) >> /root/costoeth_tx.txt
	sleep 15
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
	printf '%s\n' "" >> /root/costoeth_raw.txt
	sleep 5
done <costoeth_tx.txt
