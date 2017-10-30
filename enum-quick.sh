#!/bin/bash

ip=$1

nmap -v -sV -T4 -O -F --version-light $ip;