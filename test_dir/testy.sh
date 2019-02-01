#!/bin/bash 
# mjk235 [at] nyu [dot] edu

# Iterate through files, finding and replacing string for files of type, e.g.:  
# pink_white_blue00.txt --> red_white_blue00.txt  
# pink_white_blue01.txt --> red_white_blue01.txt 

# Preview files in current working directory.  

show_files() {
  printf "%s\n" "Files in your current directory: " 
  sleep 1.5

  ls -Cp |grep --invert-match /
} 

# Define file type to be modified, e.g. .csv, .json, .txt.

input_file_type() {
  printf "%s\n" "File extensions look like this: csv, json, txt." 
  read -p "Enter the extension of the files you want to modify: " file_type
} 

# Define string to search for.  

input_to_find() {
  read -p "Enter the string to find: " find_string 
} 

# Define string to replace. 

input_to_replace() {
  read -p "Enter the string to replace: " replace_string 
} 

# Preview changes.  

preview_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in *$file_type; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 

# Confirm changes are acceptable; exit if not Y or y.  

confirm_changes() { 
  read -p "Replace:'$find_string' with:'$replace_string'(y/n)? " answer 
   
  if [ "$answer" != "${answer#[Yy]}" ]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi
} 

# Replace "find_string" with "replace_string" using mv for files of "file_type"

bulk_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *$file_type ; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 

# Main 

printf "%s\n" "Bulky: A shell script to rename files en masse."

main() {
  show_files
  input_file_type
  input_to_find
  input_to_replace 
  preview_changes
  confirm_changes
  bulk_rename
} 

main "$@" 
