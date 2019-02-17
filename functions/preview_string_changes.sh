#!/bin/bash 


file_type=txt
find_string="long_winding"
replace_string="yellow_brick" 

preview_changes() {
  printf "%s\n" "Generating preview..."
 
  for file in *"$file_type"; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 
 
preview_changes
