t() {
  SESSION_NAME=$(date +%s)

  if [ "$1" != "" ]; then
    SESSION_NAME=$1
  fi

  tmux new -s "$SESSION_NAME"
}
