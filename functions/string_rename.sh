#!/bin/bash
# Replace 1st occurrence of "find_string" with "replace_string" in all files. 
# using verbose mv 

string_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
} 
