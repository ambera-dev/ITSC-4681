#!/bin/bash

PACKAGES=(
	nmap
	wireshark
	tcpdump
)
echo "Detecting your package manager..."

#If one of these returns an error, skip it. Else, keep going to next option:

if command -v apt-get >/dev/null 2>&1; then
	echo "Using apt as the package manager."
elif command -v yum >/dev/null 2>&1; then
	echo "Using yum as the package manager."
else
	echo "Unable to 

