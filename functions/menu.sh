#!/bin/bash

# Display pause prompt
# Suspend processing of script; display message prompting user to press [Enter] key to continue

function pause() {
    local message="$*"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message"
}

# Display on-screen menu 

function show_menu() {
    date
    printf "%s\\n" "------------------------------"
    printf "%s\\n" "  BULKY Main Menu             "
    printf "%s\\n" "------------------------------"
        printf "%s\\n" "  1. Rename files by string"
        printf "%s\\n" "  2. Rename files extension "
        printf "%s\\n" "  3. EXIT"
}

# Get input via the keyboard and make a decision using case...esac 

function read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) printf "%s\\n" "OPTION 1" ;;
        2) printf "%s\\n" "OPTION 2" ;;
        3) printf "%s\\n" "Ciao!"; exit 0 ;;
        *)
           printf "%s\\n" "Select an Option (1 to 3):  "

           pause "$@"
    esac
}

# while loop for user input

while true
do
    show_menu
    read_input "$@"
done
