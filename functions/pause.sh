#!/bin/bash 
# Pause function. 

function pause() {
    local message="$@"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message" readEnterKey
}

pause
