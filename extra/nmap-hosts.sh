#!/bin/bash

for server in $(cat $1);do
	# For each of these servers, attempt a zone transfer
	mkdir -p ~/nmap/$server
	nmap -sS -T4 -A $server -oA ~/nmap/$server/$server
done