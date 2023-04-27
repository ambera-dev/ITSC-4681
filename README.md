# ITSC-4681
University of North Carolina at Charlotte - Spring 2023
Undergraduate Senior Capstone - Network Analysis Web Interface
Authors: [Amber Atkins](https://www.linkedin.com/in/amber-atkins-2556941bb), [Max Carey](https://www.linkedin.com/in/max-carey-7a9334191/)
## Introduction
This is a web application that combines different network analysis tools into a graphical interface. This application allows the user to use nmap, tshark, tcpdump, and system network analysis tools in one place.
## Packages Included
- [Nmap](https://nmap.org/)
- [Wireshark](https://www.wireshark.org/) with tshark
- [TCPDUMP](https://www.tcpdump.org/)  

(More to be added)
## Installation
There are installation scripts included in this application for installing dependencies for Windows, Linux, and Mac. 

**Note:** These installers will require administrative privileges to install dependencies. These will only be used for the installation of packages, and if the user wishes to use further capabilities for nmap, tshark, or tcpdump. Installers may be incorrectly flagged by antivirus, since they require an Internet connection to download dependencies.

**Note:** Linux installation installs through most mainstream package managers, including:
 - [apt](https://linuxize.com/post/how-to-use-apt-command/)
 - [yum](https://access.redhat.com/solutions/9934)
 - [DNF](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)
 - [pacman](https://wiki.archlinux.org/title/pacman)

[CMake](https://cmake.org/install/), [M4](https://www.gnu.org/software/m4/), [QT](https://doc.qt.io/qt-6/linux.html), and [GLib](https://docs.gtk.org/glib/) will need to be installed already, but should be pre-installed by default for most distributions.


### Windows:
*Windows installer may be changed to a compiled format later.*
1. Clone the GitHub repository with `git clone https://github.com/ambera-dev/ITSC-4681`
2. Open the downloaded ITSC-4681 folder and click the `windows_installer.exe`.
3. When UAC prompts for administrative privileges, click "Yes".
4. The installer will run from a command prompt window.
5. Each package's installer will run once downloaded.

### Linux:
1. Clone the GitHub repository with `git clone https://github.com/ambera-dev/ITSC-4681`
2. Open a terminal and change the directory to the ITSC-4681 directory. `cd ITSC-4681`
3. Change the permission of the installer file with `chmod +x linux_installer.sh`
4. Run the installer with `sudo ./linux_installer.sh`.

### Mac:
*Under Construction*