#!/bin/bash 

# Prompt user for confirmation; exit if not "yes"
# Pipe reply to tr to convert to lower case . 
# Even though we ask for "YES" we will accept, e.g. yes, YeS, yeS. 

confirm_changes() { 
  read -p "Replace: 'this' with: 'that'(YES/NO)? " answer 

  answer=$(printf "%s" "$answer"| tr '[:upper:]' '[:lower:]')

  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi 
}

confirm_changes 
