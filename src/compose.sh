#!/bin/bash 
# mjk235 [at] nyu [dot] edu

#### MENU ####

# Pause function. 

function pause() {
    local message="$@"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message" readEnterKey
}

# On-screen menu.

function show_menu() {
    date
    printf "%s\\n" "------------------------------"
    printf "%s\\n" "  BULKY: Main Menu            "
    printf "%s\\n" "------------------------------"
        printf "%s\\n" "  1. Rename files by string"
        printf "%s\\n" "  2. Rename files by type"
        printf "%s\\n" "  3. Exit"
}

# Get input via keyboard and make a decision using case...esac. 

function read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) bulky_by_string ;;
        2) bulky_by_type ;;
        3) printf "%s\\n" "Ciao!"; exit 0 ;;
        *)
           printf "%s\\n" "Select an Option (1 to 3):  "

           pause
    esac
}

#### BULKY #### 

# Show files in current working directory. 

show_files() { 
  printf "%s\n" "Files in current directory: "
  sleep 1 

  ls -Cp |grep --invert-match / 
} 

# Define file type to search for, e.g. .csv, .html, .json, .txt.

input_file_type() {
  read -p "Enter the extension of the files you want to modify: " file_type

  file_type=${file_type//.}
} 

# Define string to find. 

input_to_find() {
  read -p "Enter the string to find: " find_string 
} 

# Define string to replace.  

input_to_replace() {
  read -p "Enter the string to replace: " replace_string 
} 

# Preview changes for bulk rename by string starts with.
 
preview_string_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in $find_string*; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Preview changes for bulk rename by type. 

preview_type_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in *$file_type; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
}

# Confirm changes are acceptable; exit if not yes.  

confirm_changes() { 
  read -p "Replace:'$find_string' with:'$replace_string'(YES/NO)? " answer 

  answer=$(printf "%s" "$answer"| tr '[:upper:]' '[:lower:]')
   
  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi
} 

# Replace "find_string" with "replace_string" using mv for files. 

string_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in $find_string*; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 

# Replace "find_string" with "replace_string" using mv for files of type x
 
type_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *$file_type ; do 
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

bulky_by_type() {
  show_files
  input_file_type
  input_to_find
  input_to_replace 
  preview_type_rename
  confirm_changes
  type_rename
} 

#### MAIN #### 

main() {
  cat << EOF
BULKY: A shell script to rename files en masse. 

BULKY searches for and replaces the first occurrence of a string in all files  
that BEGIN with a search term (by string), e.g.:  

pink_white_blue_00.csv --> red_white_blue_00.csv
pink_white_blue_00.html --> red_white_blue_00.html 
pink_white_blue_00.txt --> red_white_blue_00.txt 

or all files with an extension (by type), e.g.: 

pink_white_blue_00.txt --> red_white_blue_00.txt  
pink_white_blue_01.txt --> red_white_blue_01.txt 
pink_white_blue_02.txt --> red_white_blue_02.txt 

EOF
  pause 

  while true 
  do 
    clear 
    show_menu
    read_input
    pause
  done 
} 

main "$@"
