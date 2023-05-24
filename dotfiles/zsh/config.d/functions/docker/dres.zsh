dres() {
  h2 "Restarting container '$1'..."
  CONTAINER=$(docker ps --format='{{.ID}} [{{.Names}}]' | fzf --border=none --layout=reverse | awk '{print $1}')
  docker restart $CONTAINER
  h2 "Restart completed."
}
