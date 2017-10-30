#!/bin/bash

trap "exit" INT

base=$1

for ip in $(seq  1 255);do
	ping -c 1 -W 1 $base.$ip | grep 'from' |cut -d " " -f 4 |cut -d ":" -f 1 &
done
