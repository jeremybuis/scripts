#!/bin/bash

ip=$1

snmp-check $ip

snmpwalk -c public -v1 $ip