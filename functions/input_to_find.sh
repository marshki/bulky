#!/bin/bash 
#  Retrieve & assign user input. 
# read -r (esc. key binding) & present prompt  

input_to_find() { 
  read -rp "Enter a string: " find_string 

  printf "%s\n" "$find_string"

} 

input_to_find
