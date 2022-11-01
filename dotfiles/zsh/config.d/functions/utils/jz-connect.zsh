jz-connect() {
  if [ "$1" != "" ]; then
    HOST=$1
  else
    HOST=$(jz hosts list | fzf | awk '{print $4}')
  fi

  if [ "$HOST" != "" ]; then
    h2 "Connecting with '$HOST'..."
    jssh $HOST
  else
    h2 "No host has been selected!"
  fi
}
