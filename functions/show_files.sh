#!/bin/bash
# Show files in current directory 
# find (use -- so names with dashes will not become options with glob)
# no deeper than current directory showing only files

show_files() { 
  printf "%s\n" "Files in current directory: " 
  sleep 1.5 

  find -- * -maxdepth 0 -type f
}

show_files 
