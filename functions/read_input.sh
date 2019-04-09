#!/bin/bash 
# Get input via keyboard and make a decision using case...esac. 
# read -r (do not allow backslashes to escape any characters) -p (prompt)  

function read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) printf "%s\n" "Choice 1" ;;
        2) printf "%s\n" "Choice 2" ;;
        3) printf "%s\\n" "Choice 3"; exit 0 ;;
        *)
           printf "%s\\n" "Select an Option (1 to 3):  "

           #pause
    esac
}

read_input
