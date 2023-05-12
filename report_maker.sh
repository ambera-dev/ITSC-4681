#!/bin/bash

function userConsent(){
    echo "Would you like to run?"
    read -p "(Y/n) " choice
    case $choice in
        Y | y )
            return 0
            ;;
        N | n )
            return 1
            ;;
        * )
         echo "Invalid input, exitting program."
         return 0
         ;;
    esac
}

function toolCheck(){
    tools=("nmap" "tshark" "tcpdump")
    toolchk=()
    for pkg in "${tools[@]}"
	do
		if command -v $pkg >/dev/null 2>&1; then
	        toolchk+=("$pkg")
        fi
	done
    #print all tools available
    for chk in "${toolchk[@]}"
    do
        echo "$chk"
    done
}

function menu(){
    outFile=out/outFile.txt
    nmapOut=out/nmap.txt
    tsharkOut=out/tshark.txt
    clear
    printf "\tNetwork Analysis Report Maker\n"
    printf "Please make a selection below.\nAvailable tools are:\n"
    toolCheck
    printf "\n1. NMAP Quick Scan\n2. NMAP Deep Scan\n3. tshark Quick Scan\n4. TCPDUMP Port-Specific Scan\n5. View Report (text file)\n"
    read -p "Enter choice " choice
    case $choice in 
        1 ) 
             if userConsent 0; then
                read -p "NMAP on which IP address?: " ipaddr
                 echo "----------NMAP QUICK SCAN----------" >> $outFile
                 nmap -F $ipaddr | tee -a $outFile | tee -a $nmapOut
               
            fi
            ;;
        2 )
            if userConsent 0; then
                read -p "NMAP on which IP address?: " ipaddr
                echo "----------NMAP DEEP SCAN----------" >> $outFile
                nmap -T4 -A $ipaddr | tee -a $outFile | tee -a $nmapOut
                
            fi
            ;;
        3 )
            if userConsent 0; then
                echo "TShark will listen for all traffic for one minute."
                echo "----------TSHARK QUICK SCAN----------" >> $outFile
                sudo tshark -a duration:60 | tee -a $outFile | tee -a $tsharkOut
            fi
            ;;
        4 )
            if userConsent 0; then
                while :; do
                    read -p "TCPDUMP on which port?: " portNum
                    [[ $portNum =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue; }
                    if (( portNum >= 1 && portNum <= 65535  )); then
                         echo "----------TCPDUMP SCAN----------" >> $outFile
                         echo "TShark will listen for traffic on port $portNum for one minute."
                         sudo timeout 60 tcpdump -nnS port $portNum >> $outFile
                        break
                    else
                        echo "Please enter a valid TCP/UDP port number."
                    fi
                done
            fi
             ;;

        5 )
            if [ ! -f "$outFile" ]; then
                echo "Analysis has not been run yet. No report created."
            else 
                vim $outFile
            fi
            ;;

        * )
            echo "Invalid Input. Exitting" ;;
    esac
}

menu

#after first run, ask if the user would like to add anything else.
while true; do
    read -p "Run another scan? (Y/n) " choice
     case $choice in
        Y | y )
            menu
            ;;
        N | n )
            break
            ;;
        * )
         echo "Invalid input, please enter (Y/n)."
         ;;
    esac
done