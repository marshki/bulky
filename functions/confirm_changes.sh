#!/bin/bash 

# Prompt user for confirmation. 
# Exit if input not yes 
# --> maybe strip Yes to lower case to be acceptable as well
# --> script should probably loop back if not yes 

confirm_changes() { 
  read -p "Replace: 'this' with: 'that'(yes/no)? " answer 

  if [[ "$answer" = "yes" ]]; then
      printf "%s\n" "Continuing..."
  else
      printf "%s\n" "Exiting." 
      exit 1
  fi 
}

confirm_changes 
