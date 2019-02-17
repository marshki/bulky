#!/bin/bash 

# Retrieve & assign user input. 

input_to_find() { 
  read -p "Enter a string: " find_string 

  printf "%s\n" $find_string

} 

input_to_find
