#!/bin/bash 
# mjk235 [at] nyu [dot] edu

#### BULKY will replace the first occurrence of: x with y in file names. ####
 
# orange_white_blue00.txt --> red_white_blue00.txt  
# orange_white_blue00.csv --> red_white_blue00.csv
# orange_white_blue01.txt --> red_white_blue01.txt 
# orange_white_blue01.csv --> red_white_blue01.txt 

#### Pause function.  ####

function pause() {
    local message="$@"
    [ -z "$message" ] && message="Press [Enter] key to continue:  "
    read -rp "$message" readEnterKey
}

#### Display on-screen menu. ####

function show_menu() {
    date
    printf "%s\\n" "------------------------------"
    printf "%s\\n" "  Main Menu                   "
    printf "%s\\n" "------------------------------"
        printf "%s\\n" "  1. BULK RENAME BY STRING"
        printf "%s\\n" "  2. BULK RENAME BY EXTENSION"
        printf "%s\\n" "  3. EXIT"
}


#### Meat & Potatoes #### 

# Show files in current working directory. 

show_files() { 
  printf "%s\n" "Files in current directory: "
  sleep 1.5 

  ls -Cp |grep --invert-match / 
} 

# Define file type to be modified, e.g. .csv, .json, .txt.

input_file_type() {
  printf "%s\n" "File extensions look like this: csv, json, txt." 
  read -p "Enter the extension of the files you want to modify: " file_type

  file_type=${file_type//.}
} 

# Define string to search for. 

input_to_find() {
  read -p "Enter the string to find: " find_string 
} 

# Define string to search for.  

input_to_replace() {
  read -p "Enter the string to replace: " replace_string 
} 

# Preview changes for bulk rename by string.   

preview_bulk_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in $find_string*; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Preview changes for bulk rename by type. 

preview_type_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in *$file_type; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
}

# Confirm changes are acceptable; exit if not yes.  

confirm_changes() { 
  read -p "Replace:'$find_string' with:'$replace_string'(YES/NO)? " answer 
   
  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi
} 

# Replace "find_string" with "replace_string" using mv for files. 

bulk_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in $find_string*; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 

type_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *$file_type ; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
}

#### BULKY ####

bulky() { 
  show_files
  input_to_find 
  input_to_replace
  preview_bulk_changes
  confirm_changes
  bulk_rename
} 

typey() {
  show_files
  input_file_type
  input_to_find
  input_to_replace 
  preview_type_changes
  confirm_changes
  type_rename
} 

#### Get input via the keyboard and make a decision using case...esac ####

function read_input() {
    local c
    read -rp "Enter your choice [ 1-3 ]:  " c
    case $c in
        1) bulky ;;
        2) typey ;;
        3) printf "%s\\n" "Ciao!"; exit 0 ;;
        *)
           printf "%s\\n" "Select an Option (1 to 3):  "

           pause
    esac
}

# Main 

printf "%s\n" "BULKY: A Bash script to rename files en masse."

main() {

  while true 
  do 
    clear 
    show_menu
    read_input
  done 
} 

main "$@" 