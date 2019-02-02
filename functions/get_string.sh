#!/bin/bash 

# Retrieve & assign user input. 

get_string() { 
  read -p "Enter a string: " some_string 

  printf "%s\n" $some_string 

} 

get_string 
