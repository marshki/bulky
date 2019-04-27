#!/bin/bash 
# Prompt user for confirmation; exit if not "yes" or "menu"
# Pipe reply to tr to convert to lower case . 
# Even though we ask for "UPPERCASE" we will accept: 
# upper, UpPeRcAsE, UPPERCASE, e.g.

confirm_changes() { 
  read -rp "Replace: 'this' with: 'that'(YES/NO/MENU)? " answer 

  answer=$(printf "%s" "$answer"| tr '[:upper:]' '[:lower:]')

  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."

  elif [[ "$answer" = "no" ]]; then 
      printf "%s\n" "Exiting..." 
      exit 1

  else 
      printf "%s\n" "Returning to main menu..."
  fi 
}

confirm_changes 
