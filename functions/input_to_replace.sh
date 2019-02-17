#!/bin/bash 
#  Retrieve & assign user input. 
# read -r (esc. key binding) & present prompt  

input_to_replace() { 
  read -rp "Enter a string: " replace_string 

  printf "%s\n" "$replace_string"

} 

input_to_replace
