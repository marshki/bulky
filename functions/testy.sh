#!/bin/bash 
# mjk235 [at] nyu [dot] edu

# Iterate through files, replacing user designated string, e.g.:  
# pink_white_blue00.txt --> red_white_blue00.txt  
# pink_white_blue00.csv --> red_white_blue00.csv
# pink_white_blue01.txt --> red_white_blue01.txt 
# pink_white_blue01.csv --> red_white_blue01.txt 

# File type to be modified, e.g. .csv, .json, .txt.

input_file_type() {
  read -p "Enter the file type of the files you want to modify: " file_type
} 

# String to search for.  

input_to_find() {
  read -p "Enter the string to find: " find_string 
} 

# String to replace. 

input_to_replace() {
  read -p "Enter the string to replace: " replace_string 
} 

# Preview of changes.  

preview_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in *$file_type; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Read user input; exit if not Y or y.  

confirm_changes() { 
  read -p "Confirm change from:'$find_string' to:'$replace_string'(y/n)? " answer 
   
  if [ "$answer" != "${answer#[Yy]}" ]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi
} 

# Rename each file beginning with "find_string*", 
# replacing "find_string" with "replace_string" using mv.

bulk_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *$file_type ; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 

# Main 

printf "%s\n" "Bulky: A Bash script to rename files en masse."

main() {
  input_file_type
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