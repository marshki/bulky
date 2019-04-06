#!/bin/bash
# test loop for BULKY 

while : ; do  
  printf "%s\n" "Do this!" 
  printf "%s\n" "Do that!" 
  printf "%s\n" "And this, too!" 
  
  read -rp "Do you wish to continue (Yes/No)?: " reply 
  printf "%s\n" "$reply"

  if [[ "$reply" == "yes" ]]; then 
      printf "%s\n" "OK. Give me some more." 

  elif [[ "$reply" == "no" ]]; then 
      printf "%s\n" "OK. You are free."
      break 

  fi 
done
