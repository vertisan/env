displays() {
    # sudo systemctl restart lightdm
  case $1 in
    home)
      xrandr --auto
      xrandr --output DP-1 --mode 1920x1080 --rate 60 --pos 1920x0
      xrandr --output DP-2 --mode 1920x1080 --rate 60 --same-as eDP-1
      ;;
    home-dock)
      xrandr --auto
      xrandr --output DP-1-2 --mode 1920x1080 --rate 60 --pos 1920x0
      xrandr --output DP-1-1 --mode 1920x1080 --rate 60 --same-as eDP-1
      ;;
    office)
      xrandr --output DP-1-1-8 --off
      xrandr --output DP-1-1-1 --off
      xrandr --auto
      xrandr --output DP-1-1-8 --mode 1920x1080 --rate 60 --same-as eDP-1
      xrandr --output DP-1-1-1 --mode 1920x1080 --rate 60 --pos 1920x0
      ;;
    dock-lg)
      xrandr --auto
      xrandr --output DP-2-3 --mode 2560x1080 --rate 60 --pos -2560x0
      ;;
    *)
      h1 "Connected displays:"
      xrandr --query | grep " connected" | cut -d" " -f1
      h1 "Available profiles:"
      h3 "home"
      h3 "home-dock"
      h3 "office"
      h3 "dock-lg"
      ;;
  esac
}
