#!/bin/zsh
#set -eo


DOTFILES_PATH="$PWD"
HOME_PATH="$HOME"
DOTCONFIG_PATH="$HOME/.config"

#####
### Z S H
#####
ln -sfn "$DOTFILES_PATH/zsh/.zshrc" "$HOME"
ln -sfn "$DOTFILES_PATH/zsh/config.d" "$DOTCONFIG_PATH"
source "$HOME/.zshrc"
zshconfig


#####
### A L A C R I T T Y
#####
ln -sfn "$DOTFILES_PATH/alacritty" "$DOTCONFIG_PATH"


#####
### S W A Y
#####
ln -sfn "$DOTFILES_PATH/sway-env/sway" "$DOTCONFIG_PATH"
ln -sfn "$DOTFILES_PATH/sway-env/swaylock" "$DOTCONFIG_PATH"
ln -sfn "$DOTFILES_PATH/sway-env/swayr" "$DOTCONFIG_PATH"
swaymsg reload


#####
### W A Y B A R
#####
ln -sfn "$DOTFILES_PATH/waybar" "$DOTCONFIG_PATH"


#####
### R O F I
#####
# ln -sfn "$DOTFILES_PATH/rofi" "$DOTCONFIG_PATH"


#####
### W O F I
#####
ln -sfn "$DOTFILES_PATH/wofi" "$DOTCONFIG_PATH"


#####
### M A K O
#####
ln -sfn "$DOTFILES_PATH/mako" "$DOTCONFIG_PATH"


#####
### N W G - BAR
#####
ln -sfn "$DOTFILES_PATH/nwg-bar" "$DOTCONFIG_PATH"


#####
### N V I M
#####
# yay -S neovim
ln -sfn "$DOTFILES_PATH/nvim" "$DOTCONFIG_PATH"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#####
### P O L Y B A R
#####
# ln -sfn "$DOTFILES_PATH/polybar" "$DOTCONFIG_PATH"


#####
### K A N S H I
#####
ln -sfn "$DOTFILES_PATH/kanshi" "$DOTCONFIG_PATH"
systemctl --user restart kanshi.service
systemctl --user status kanshi.service


#####
### G I T
#####
ln -sfn "$DOTFILES_PATH/git/.gitconfig" "$HOME_PATH"
# ln -sfn "$DOTFILES_PATH/git/.gitignore_global" "$HOME_PATH"
