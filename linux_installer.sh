#!/bin/bash

packages=(
	nmap
	wireshark
	tcpdump
	libpcap
	flex
	bison
)



function tarballpack(){
	SECONDS=0
	#make installer dir
	mkdir ~/Desktop/Installers
	cd ~/Desktop/Installers || return
	#nmap
	wget https://nmap.org/dist/nmap-7.93.tgz
	#wireshark
	wget https://www.wireshark.org/download/src/wireshark-latest.tar.xz 
	#tcpdump
	wget https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz
	#libpcap
	wget https://www.tcpdump.org/release/libpcap-1.10.4.tar.gz 
	#libpcap dependencies
	wget https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
	wget http://ftp.gnu.org/gnu/bison/bison-3.8.tar.xz
	#unpacking tarballs
	tar -zxf nmap-7.93.tgz
	tar -xf wireshark-latest.tar.xz
	tar -zxf tcpdump-4.99.3.tar.gz
	tar -zxf libpcap-1.10.4.tar.gz
	tar -zxf flex-2.6.4.tar.gz
	tar -xf bison-3.8.tar.xz
	rm nmap-7.93.tgz wireshark-latest.tar.xz tcpdump-4.99.3.tar.gz libpcap-1.10.4.tar.gz flex-2.6.4.tar.gz bison-3.8.tar.xz
	#these are very noisy, maybe pipe the stderr/stdout output somewhere?
	cd flex-2.6.4
	./configure && make -s && sudo make install
	cd ../bison-3.8
	./configure && make -s && sudo make install
	cd ../libpcap-1.10.4
	./configure && make -s && sudo make install
	cd ../tcpdump-4.99.3
	./configure && make -s && sudo make install
	cd ../nmap-7.93
	./configure && make -s && sudo make install
	cd ../wireshark-*
	cmake && make && sudo make install
	echo "Installation finished. Time elasped: $SECONDS seconds."
}

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

elif command -v dnf >/dev/null 2>&1; then
	echo "Using dnf as the package manager."
	packmanager="dnf"

elif command -v pacman >/dev/null 2>&1; then
	echo "Using pacman as the package manager."
	packmanager="pacman"
else
	echo "Unable to detect package manager. Installing from tarball source...this should take around 5 minutes."
fi

if [ "$packmanager" != "NULL" ]; then
	for pack in "${packages[@]}"
	do
		case $packmanager in
			apt | yum | dnf )
			sudo $packmanager install -y "$pack"
			;;
			pacman )
			sudo $packmanager -S "$pack"
			;;
		esac
	done
else
	tarballpack
fi
}

#user consent prompt
echo "The following packages will be installed: "
for pack in "${packages[@]}" 
	do
		printf "%s\n", "$pack"
	done
echo "Do you want to continue? [Y/n]"
read -r choice

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