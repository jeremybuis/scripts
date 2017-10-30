#!/bin/bash

IP=$1

unicornscan -i tap0 -I -mU $IP:a
nmap -e tap0 -n -v -Pn -sV -sC --version-light -A -sU $IP