#!/usr/bin/python

# add import names from list
# accept ip and port from command line

import socket
import sys
import os.path
import re

import argparse

parser = argparse.ArgumentParser(description="SMTP VRFY Enum")

parser.add_argument('host', help="The host to scan")
parser.add_argument('username', help="try a username againts the host")
parser.add_argument('-p', '--port', type=int, default=25, help="The port to scan")



def send_vrfy(host, usernames, port=25):

	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.settimeout(60)
	recv_data = 0

	connect = s.connect((host, port))
	banner = s.recv(1024)
	print banner
	
	for username in usernames:
		error = s.sendall('VRFY ' + username + '\n')

		if error:
			print "Error with user",username,",:",error
		else:
			try:
				recv_data = s.recv(1024)
			except socket.timeout:
				print "Timeout on user", username

		if recv_data:
			# print recv_data
			if re.match("250", recv_data):
				print "Found: ", username
			elif re.match("502", recv_data):
				print "VRFY not supported"
			elif re.match("550", recv_data):
				print "Not Found: ", username
			else:
				print "Unknown Error"
		else:
			print "\nNo recv_data"


	s.shutdown(2)
	s.close()


def get_hosts(host_file):
	with open(host_file) as f:
  		hosts = [x for x in f.readlines()]
  		return hosts


def get_usernames(username_file):
	with open(username_file) as f:
  		usernames = [x.strip().lower() for x in f.readlines()]
  		return usernames


def main():
	print "SMTP VRFY Checker"

	args = parser.parse_args()

	host = args.host
	username = args.username
	port = args.port

	if os.path.isfile(host):
		hosts = get_hosts(host)
	else:
		hosts = [host]

	if os.path.isfile(username):
		usernames = get_hosts(username)
	else:
		usernames = [username]


	for host in hosts:
		send_vrfy(host, usernames)


if __name__ == "__main__":
    main()