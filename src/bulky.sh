#!/usr/bin/env bash 
# 
# bulky
# 
# Shell script to rename files en masse. 
#
# Author M. Krinitz <mjk235 [at] nyu [dot] edu>
# Date: 
# License: MIT

LOG_FILE="bulky.sh.log"

#####
# LOG
#####

# Write changes w/ timestamp to LOG_FILE for tracking. 

log () {
  printf "%s\n" "$(date +"%b %d %X :") $*" |tee -a "$LOG_FILE"
}

######
# MENU 
######

# Pause function. 

pause() {
    local message="$*"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message" 
}

# On-screen menu.

show_menu() {
    date
    printf "%s\n" "------------------------------"
    printf "%s\n" "  BULKY: Main Menu            "
    printf "%s\n" "------------------------------"
        printf "%s\n" "  1. Rename by string"
        printf "%s\n" "  2. Rename by string, limit to extension"
        printf "%s\n" "  3. Exit"
}

# Get input via keyboard and make a decision using case...esac. 

read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) bulky_by_string ;;
        2) bulky_by_extension ;;
        3) printf "\n%s\n" "Ciao!"; exit 0 ;;
        *)
           printf "%s\n" "Select an Option (1 to 3):  "
           pause "$@"
    esac
}

#######
# BULKY
#######

# Show files in current working directory. 

show_files() {
  printf "\n%s\n\n" "Files in current directory: "
  sleep 1 

  find -- * -maxdepth 0 -type f
} 

# Define string to find. 

input_to_find() {
  read -rp "
Enter the string to find: " find_string 
} 

# Define string to replace.  

input_to_replace() {
  read -rp "
Enter the string to replace: " replace_string 
} 

# Define file extension to search for, e.g. .csv, .html, .json, .txt.

input_file_extension() {
  read -rp "
Enter the extension of the files you want to modify: " file_ext

  file_ext=${file_ext//.}
} 

# Preview changes for bulk rename by string.
 
preview_string_rename() {
  printf "\n%s\n\n" "Generating preview..."
 
  for file in *; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Preview changes for bulk rename by extension. 

preview_extension_rename() {
  printf "\n%s\n\n" "Generating preview..."
 
  for file in *"$file_ext"; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
}

# Confirm changes are acceptable; exit if not yes or menu.  

confirm_changes() { 
  read -rp "
Replace:'$find_string' with:'$replace_string'(YES/NO/MENU)? " answer 

  answer=$(printf "%s" "$answer"| tr '[:upper:]' '[:lower:]')
   
  if [[ "$answer" = "yes" ]]; then
      printf "\n%s\n\n" "Continuing..."

  elif [[ "$answer" = "no" ]]; then
      printf "\n%s\n\n" "Exiting..."
      exit 1 

  else
      printf "\n%s\n" "Returning to Main Menu..." 
      main 
  fi
} 

# Replace 1st occurrence of "find_string" with "replace_string" in all files. 

string_rename() {
  printf "%s\n\n" "Renaming files..."
 
  for file in *; do 
    log "$(mv -v "$file" "${file/$find_string/$replace_string}")"   
  done

  printf "\n%s\n\n" "Done."
} 

# Replace 1st occurrence of "find_string" with "replace_string"
# for files of defined extension.  

extension_rename() {
  printf "%s\n\n" "Renaming files..."
 
  for file in *"$file_ext"; do 
    log "$(mv -v "$file" "${file/$find_string/$replace_string}")"
  done

  printf "\n%s\n\n" "Done."
}

##########
# WRAPPERS
##########

bulky_by_string() { 
  show_files
  input_to_find 
  input_to_replace
  preview_string_rename
  confirm_changes
  string_rename
} 

bulky_by_extension() {
  show_files
  input_file_extension
  input_to_find
  input_to_replace 
  preview_extension_rename
  confirm_changes
  extension_rename
} 

###### 
# MAIN
######

main() {
  cat << EOF

BULKY: A shell script to rename files en masse. 

BULKY finds and replaces the FIRST occurrence of a string in ALL file names 
that CONTAIN that string, e.g.: 

| Find: "tale"     | Replace: "tail"  |
|------------------|------------------|
| tall_tales.csv   | tall_tails.csv   | 
| tall_tales.html  | tall_tails.html  | 
| tall_tales.json  | tall_tails.json  | 
| tall_tales.txt   | tall_tails.txt   | 

BULKY can also find/replace the FIRST occurrence of a string in ALL file names 
that CONTAIN that string and END WITH a specific file extension, e.g.: 

| Find: "tale"     | Extension: "txt" | Replace: "tail"  |
|------------------|------------------|------------------|
| duck_tales.html  |                  | duck_tales.html  | 
| fairy_tales.txt  |            -->   | fairy_tails.txt  | 
| snails_tales.csv |                  | snails_tales.csv |
| tall_tales.txt   |            -->   | tall_tails.txt   | 
| whales_tales.txt |            -->   | whales_tails.txt | 

EOF
  pause 

  while true 
  do 
    clear 
    show_menu
    read_input "$@"
    pause
  done 
} 

main "$@"
