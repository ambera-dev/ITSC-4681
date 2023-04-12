# ITSC-4681
University of North Carolina at Charlotte - Spring 2023
Undergraduate Senior Capstone - Network Analysis Web Interface
## Introduction
This is a web application that combines different network analysis tools into a graphical interface. This application allows the user to use nmap, tshark, tcpdump, and system network analysis tools in one place.
## Packages Included
- [Nmap](https://nmap.org/)
- [Wireshark](https://www.wireshark.org/) with tshark
- [TCPDUMP](https://www.tcpdump.org/)
(More to be added)
## Installation
There are installation scripts included in this application for installing dependencies for Windows, Mac, and Linux. 
**Note:** These installers will require administrative privileges to install dependencies. User Account Control will be used for Windows, and sudo will be used for Mac and Linux. These will only be used for the installation of packages, and if the user wishes to use further capabilities for nmap, tshark, or tcpdump.
### Mac:
*Under Construction*
### Linux:
1. Clone the GitHub repository with `git clone https://github.com/ambera-dev/ITSC-4681`
2. Open a terminal and change the directory to the ITSC-4681 directory. `cd ITSC-4681`
3. Change the permission of the installer file with `chmod +x linux_installer.sh`
4. Run the installer with `sudo ./linux_installer.sh`.
### Windows:
*Windows installer may be changed to a compiled format later.*
1. Clone the GitHub repository with `git clone https://github.com/ambera-dev/ITSC-4681`
2. Open PowerShell and change the directory to the ITSC-4681 directory. `cd ITSC-4681`
3. Run the installer with `powershell -ExecutionPolicy Bypass -File .\windows_installer.ps1`