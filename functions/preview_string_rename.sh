#!/bin/bash 
# Preview changes
# For files in working directory
# print file changes to be applied 

find_string="long_winding"
replace_string="yellow_brick" 

preview_string_rename() {
  printf "%s\n" "Generating preview..."
 
  for file in *; do 
    printf "%s %s %s\n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 
 
preview_string_rename
