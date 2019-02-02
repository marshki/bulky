#!/bin/bash 

# Prompt to define file_type.  
# If present, strip "." then reassign output to file_type 

input_file_type() { 
  printf "%s\n" "File extensions look like this: csv, json, txt." 

  read -p "Enter the extension of the files to be modified: " file_type

  file_type="${file_type//.}"
  printf "%s\n" "$file_type" 
 
} 

input_file_type
