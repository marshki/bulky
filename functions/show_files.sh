#!/bin/bash

# Show files in current directory 
# ls column output, placing / after a filename that is a directory
# grep to return non-directories (files only)

show_files() { 
  printf "%s\n" "Files in current directory: " 
  sleep 1.5 

  ls -Cp |grep --invert-match /

}

show_files 
