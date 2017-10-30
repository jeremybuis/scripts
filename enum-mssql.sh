#!/bin/bash

ip=$1

# ms-sql-brute.nse
# ms-sql-config.nse
# ms-sql-dac.nse
# ms-sql-dump-hashes.nse
# ms-sql-empty-password.nse
# ms-sql-hasdbaccess.nse
# ms-sql-info.nse
# ms-sql-ntlm-info.nse
# ms-sql-query.nse
# ms-sql-tables.nse
# ms-sql-xp-cmdshell.nse


nmap -sV -Pn -vv --script=ms-sql-brute,ms-sql-config,ms-sql-dac,ms-sql-empty-password,ms-sql-hasdbaccess,ms-sql-dump-hashes,ms-sql-info,ms-sql-ntlm-info,ms-sql-query,ms-sql-tables,ms-sql-xp-cmdshell $1 -p27900,1433