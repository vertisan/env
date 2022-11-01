#!/usr/bin/env bash

swayidle -w \
  timeout 300 '/home/vertisan/.config/sway/bin/lockscreen.sh' \
  timeout 360 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
  before-sleep '/home/vertisan/.config/sway/bin/lockscreen.sh'
