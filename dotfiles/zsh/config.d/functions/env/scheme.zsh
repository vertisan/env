scheme() {
  IMAGE="$@"
  if [ -z "$1" ]; then
    IMAGE_NAME=$(ls ~/Wallpapers | shuf -n 1)
    IMAGE="${HOME}/Wallpapers/$IMAGE_NAME"
  fi

  wal -n -s -i $IMAGE && vi -c "|wq" ~/.config/alacritty/alacritty.yml
  FULL_IMAGE_PATH=$(< "${HOME}/.cache/wal/wal")

  # xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorHDMI1/workspace0/last-image -s ${FULL_IMAGE_PATH}
#  sed -i "s~BackgroundImageFile=.*~BackgroundImageFile=$FULL_IMAGE_PATH~" ${XDG_CONFIG_HOME:-~/.config}/xfce4/terminal/terminalrc

#  ~/.config/polybar/scripts/pywal.sh $IMAGE
}
