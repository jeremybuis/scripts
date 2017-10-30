#!/bin/bash

#10.11.1.0/24

trap "exit" INT

#for ip in $(seq  1 256);do
#	host 10.11.1.$ip;
#done

#for i in {1..254}; do ping -c 1 -W 1 10.1.1.$i | grep 'from'; done

for ip in $(seq  1 255);do
	ping -c 1 -W 1 10.11.1.$ip | grep 'from' |cut -d " " -f 4 |cut -d ":" -f 1 &
done
