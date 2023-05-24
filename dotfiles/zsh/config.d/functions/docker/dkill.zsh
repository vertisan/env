dkill() {

  if [ "$1" != "" ]; then
    h2 "Killing container '$1'..."
    docker kill $1
  else
    CONTAINER=$(docker ps --format='{{.ID}} [{{.Names}}]' | fzf --border=none --layout=reverse | awk '{print $1}')
    h2 "Killing container '$CONTAINER'"
    docker kill $CONTAINER
  fi
}
