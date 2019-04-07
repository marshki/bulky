#!/bin/bash 
# mjk235 [at] nyu [dot] edu

#### MENU ####

# Pause function. 

function pause() {
    local message="$*"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message" 
}

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

# Get input via keyboard and make a decision using case...esac. 

function read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) bulky_by_string ;;
        2) bulky_by_extension ;;
        3) printf "%s\\n" "Ciao!"; exit 0 ;;
        *)
           printf "%s\\n" "Select an Option (1 to 3):  "

           pause "$@"
    esac
}

#### BULKY #### 

# Show files in current working directory. 

show_files() { 
  printf "%s\n" "Files in current directory: "
  sleep 1 

  find -- * -maxdepth 0 -type f
} 

# Define string to find. 

input_to_find() {
  read -rp "Enter the string to find: " find_string 
} 

# Define string to replace.  

input_to_replace() {
  read -rp "Enter the string to replace: " replace_string 
} 

# Define file extension to search for, e.g. .csv, .html, .json, .txt.

input_file_extension() {
  read -rp "Enter the extension of the files you want to modify: " file_ext

  file_ext=${file_ext//.}
} 

# Preview changes for bulk rename by find string.
 
preview_string_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in *; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Preview changes for bulk rename by extension. 

preview_extension_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in *"$file_ext"; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
}

# Confirm changes are acceptable; exit if not yes or menu.  

confirm_changes() { 
  read -p "Replace:'$find_string' with:'$replace_string'(YES/NO/MENU)? " answer 

  answer=$(printf "%s" "$answer"| tr '[:upper:]' '[:lower:]')
   
  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."

  elif [[ "$answer" = "no" ]]; then
      printf "%s\n" "Exiting..."
      exit 1 

  else
      printf "%s\n" "Returning to Main Menu..." 
      main 
  fi
} 

# Replace 1st occurrence of "find_string" with "replace_string" in all files. 

string_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 

# Replace 1st occurrence of "find_string" with "replace_string"
# for files of defined extension.  

extension_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *"$file_ext"; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
}

#### WRAPPERS ####

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

#### MAIN #### 

main() {
  cat << EOF

BULKY: A shell script to rename files en masse. 

BULKY finds and replaces the FIRST occurrence of a string in ALL files  
that MATCH a search term (by string), e.g.:  

red_white_blue_00.csv --> red_pink_blue_00.csv
red_white_blue_00.html --> red_pink_blue_00.html 
red_white_blue_00.txt --> red_pink_blue_00.txt 

or that MATCH a search term (by extension) for ALL files of an extension, e.g.: 

red_white_blue_00.txt --> big_red_00.txt 
red_white_blue_01.txt --> big_red_01.txt
red_white_blue_02.txt --> big_red_02.txt

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
