#!/bin/bash 
# On-screen menu.

function show_menu() {
    date
    printf "%s\\n" "------------------------------"
    printf "%s\\n" "  BULKY: Main Menu            "
    printf "%s\\n" "------------------------------"
        printf "%s\\n" "  1. Rename files by string"
        printf "%s\\n" "  2. Rename files by extension"
        printf "%s\\n" "  3. Exit"
}

show_menu
