#!/bin/bash 
# mjk235 [at] nyu [dot] edu

# BULKY will replace the first occurrence of: x with y in file names, e.g.: 
# orange_white_blue00.txt --> red_white_blue00.txt  
# orange_white_blue00.csv --> red_white_blue00.csv
# orange_white_blue01.txt --> red_white_blue01.txt 
# orange_white_blue01.csv --> red_white_blue01.txt 

# Show files in current working directory. 

show_files() { 
  printf "%s\n" "Files in current directory: "
  sleep 1.5 

  ls -Cp |grep --invert-match / 
} 

# Define string to search for. 

input_to_find() {
  read -p "Enter the string to find: " find_string 
} 

# Define string to search for.  

input_to_replace() {
  read -p "Enter the string to replace: " replace_string 
} 

# Preview changes.  

preview_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in $find_string*; do 
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

# Main 

printf "%s\n" "BULKY: A Bash script to rename files en masse."

main() {
  input_to_find
  input_to_replace 
  preview_changes
  confirm_changes
  bulk_rename
} 

main "$@" 

#### One-liners, e.g.:  #### 
#for f in SF_spDist1*; do mv "$f" "${f/SF_spDist1/SF2}";done
#for f in SF2*; do mv "$f" "${f/SF2/SF_spDist1}";done
