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
    printf "\tNetwork Analysis Report Maker\n"
    printf "Please make a selection below.\n Available tools are:\n"
    toolCheck
    printf "\n1. NMAP Quick Scan\n2. NMAP Deep Scan\n3. tshark Quick Scan (1 minute run)\n4. Custom Scan\n"
    read -p "Enter choice " choice
    case $choice in 
        1 ) 
             if userConsent 0; then
                echo "Option 1" 
            fi
            ;;
        2 )
            echo "Option 2" ;;
        3 )
            echo "Option 3" ;;
        4 )
            echo "Option 4" ;;
        * )
            echo "Invalid Input. Exitting" ;;
    esac
}

menu