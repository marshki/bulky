#!/bin/bash 
# Preview changes
# For files in working directory of declared file extension
# print file changes to be applied 

file_ext="txt"
find_string="long_winding"
replace_string="yellow_brick" 

preview_extension_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in *"$file_ext"; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 
 
preview_extension_rename
