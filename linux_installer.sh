#!/bin/bash

packages=(
	nmap
	wireshark
	tcpdump
)

function packrun(){
echo "Detecting your package manager..."

packmanager="NULL"

#If one of these returns an error, skip it. Else, keep going to next option:

if command -v apt-get >/dev/null 2>&1; then
	echo "Using apt as the package manager."
	packmanager="apt-get"

elif command -v yum >/dev/null 2>&1; then
	echo "Using yum as the package manager."
	packmanager="yum"
else
	echo "Unable to detect package manager. Installing from tarball source..."
fi

if [ "$packmanager" != "NULL" ]; then
	for pack in "${packages[@]}"
	do
		sudo $packmanager install -y "$pack"
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
}

#user consent prompt
echo "The following packages will be installed: "
for pack in "${packages[@]}" 
	do
		printf "$pack\n"
	done
echo "Do you want to continue? [Y/n]"
read choice

case "$choice" in
	'Y' | 'y' )
		echo "Continuing with installation..."
		packrun
		;;
	'N' | 'n' )
		echo "Quitting."
		;;
		* )
		echo "Invalid input, quitting."
		;;
esac