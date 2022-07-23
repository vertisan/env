function ssocket() {
  export SWAYSOCK=$(ls /run/user/1000/sway-ipc.* | head -n 1)
}
