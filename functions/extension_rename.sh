#!/bin/bash
# Replace 1st occurrence of "find_string" with "replace_string"
# for files of defined extension using verbose mv command.

extension_rename() {
  printf "%s\n" "Renaming files..."
 
  for file in *"$file_ext"; do 
    mv -v "$file" "${file/$find_string/$replace_string}"
  done

  printf "%s\n" "Done."
}
