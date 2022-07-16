#!/usr/bin/env bash

DIR="$HOME/.config/polybar"
export NET_WIRED_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c "$DIR"/config.ini top &
    MONITOR=$m polybar --reload -c "$DIR"/config.ini bottom &
  done
else
  polybar top &
  polybar bottom &
fi
