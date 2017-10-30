#SQL Map Basher

# Options used to specify HTTP communication behaviors:

# -v: Set the verbosity level of output messages (Option details section).
# --url: Run sqlmap against a single target URL (Option details section).
# --user-agent: Providing custom User-Agent (Option details section).
# --delay: Number of seconds to hold between each HTTP(S) request (Option details section).
# --timeout: Number of seconds to wait before considering the HTTP(S) request timed out (Option details section).
# --retries: Maximum number of retries when the HTTP(S) connection timeouts (Option details section).
# --keep-alive: Use persistent HTTP(s) connections (Option details section).
# --threads: Maximum number of concurrent HTTP(S) requests that sqlmap is allowed to do (Option details section).
# --eta: Calculate and show in real time the estimated time of arrival to retrieve each query output. This is shown when the technique used to retrieve the output is any of the blind SQL injection type (Option details section).
# --batch: This will leave sqlmap to go with a default behaviour whenever user's input would be required (Option details section).

# Options used to specify audit behaviors:

# --dbms: Force back-end DBMS to this value (Option details section).
# --os: Force back-end DBMS operating system to this value (Option details section).
# --level: Level of tests to perform from 1 to 5, default is 1 (Option details section).
# --risk: Specifies the risk of tests to perform from 1 to 3, default is 1 (Option details section).
# --banner: Try to retrieve the database management systems product banner (Option details section).
# --is-dba: Detect if the current database management system session user is a database administrator (Option details section).
# --dbs: Try to enumerate the list of databases (Option details section).
# --tables: Try to enumerate DBMS database tables (Option details section).
# --technique: SQL injection techniques to test for, default is BEUST (Option details section),
#         B: Boolean-based blind SQL injection
#         E: Error-based SQL injection
#         U: UNION query SQL injection
#         S: Stacked queries SQL injection
#         T: Time-based blind SQL injection

# Options used to specify scan information's' saving behaviors:

# -s: Save and resume all data retrieved on a session file (Option details section).
# --flush-session: Flush the content of file specified by '-s' in order to avoid the caching mechanisms implemented by default in sqlmap (Option details section).
# -t: Log all HTTP traffic into a textual file (Option details section).
# --fresh-queries: Ignores query results stored in session file (Option details section).


sqlmap -v 2 --url=$1 --user-agent=SQLMAP --delay=1 --timeout=15 --retries=2 
--keep-alive --threads=5 --eta --batch --dbms=MySQL --os=Linux --level=5 --risk=4 --banner --is-dba --dbs --tables --technique=BEUST 
-s /tmp/scan_report.txt --flush-session -t /tmp/scan_trace.txt --fresh-queries > /tmp/scan_out.txt