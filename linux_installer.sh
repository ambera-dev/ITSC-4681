#!/bin/bash

PACKAGES=(
	nmap
	wireshark
	tcpdump
)
echo "Detecting your package manager..."

PACKMANAGER="NULL"

#If one of these returns an error, skip it. Else, keep going to next option:

if command -v apt-get >/dev/null 2>&1; then
	echo "Using apt as the package manager."
	PACKMANAGER="apt-get"

elif command -v yum >/dev/null 2>&1; then
	echo "Using yum as the package manager."
	PACKMANAGER="yum"
else
	echo "Unable to detect package manager. Installing from tarball source..."
fi

if [ "$PACKMANAGER" != "NULL" ]; then
	for pack in "${PACKAGES[@]}"
	do
		sudo $PACKMANAGER install -y "$pack"
	done
else
	#make installer dir
	mkdir ~/Desktop/Installers
	cd ~/Desktop/Installers
	#nmap
	wget https://nmap.org/dist/nmap-7.93.tgz
	#wireshark
	wget https://www.wireshark.org/download/src/wireshark-latest.tar.xz 
	#tcpdump
	wget https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz
	#unpacking tarballs
	tar -zxvf nmap-7.93.tgz
	tar -xvf wireshark-latest.tar.xz
	tar -zxvf tcpdump-4.99.3.tar.gz
	### TEMP do these exist ###
if [ -e nmap-7.93 ]; then
    echo "The dir exists."
else
    echo "The dir does not exist."
fi
fi

##pls work##

