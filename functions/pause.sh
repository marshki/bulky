#!/bin/bash 
# Pause function. 

# For reference: 
# https://unix.stackexchange.com/questions/134437/press-space-to-continue

# Suspend script & display message prompt 
# read -r (do not allow backslashes to escape any characters -p (prompt) 
# -z (string)

function pause() {
    local message="$*"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message"
}

pause 
