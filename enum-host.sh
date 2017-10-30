#!/bin/bash

ip=$1

nmap -vv -Pn -A -sC -sS -T 4 -p- $ip