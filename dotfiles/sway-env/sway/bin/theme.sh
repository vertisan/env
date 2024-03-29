#!/bin/sh

BLUE="\033[34m"
RED="\033[31m"
GREEN="\033[32m"
RESET_FMT="\033[0m"

theme=$(wal --theme | grep "-" | awk '{print $2}' | fzf --height=20 --min-height=5 --reverse)

if [ "$theme" = '' ]; then
  printf "${RED}%s${RESET_FMT}\n" "No theme chosen, exiting..."
  exit 1
fi

# wal -n --theme "$theme" -s -o "$HOME/.config/alacritty/build_config.py"
wal -n --theme "$theme" -s
