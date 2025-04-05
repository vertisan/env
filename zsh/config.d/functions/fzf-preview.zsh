#!/usr/bin/env zsh

# Check if the file exists
if [[ -e "$1" ]]; then
  # If the file is a regular text file, display its content
  if [[ $(file --mime-type -b "$1") == text/* ]]; then
    # Use bat for syntax highlighting or fallback to cat
    (bat --paging=never --color=always --style=numbers "$1" || cat "$1") 2> /dev/null | head -500
  else
    # If not a text file, display the file type
    file "$1"
  fi
else
  # If the file does not exist, print the filename
  echo "$1"
fi
