#!/bin/bash 
# Exit code status

exit_code() { 

  if [ $? -eq 0 ]; then 
    printf "%s\n" "Success."
    #exit 0
  else
    printf "%s\n" "Failure." >&2
    #exit 1
  fi
}

touch ./test 2> /dev/null
exit_code  

touch root/test 2> /dev/null
exit_code
