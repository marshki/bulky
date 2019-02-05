#!/bin/bash 


find_string="the_long_and_winding"
replace_string="the_yellow_brick" 

another_preview() {
  printf "%s\n" "Generating preview..."
 
  for file in $find_string*; do 
    printf "%s %s \n" "$file" "-->" "${file/$find_string/$replace_string}" 
  done
} 
 
another_preview
