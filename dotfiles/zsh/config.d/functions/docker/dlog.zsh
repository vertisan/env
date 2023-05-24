dlog() {
  h2 "Getting logs for container '$1'..."
  CONTAINER=$(docker ps --format='{{.ID}} [{{.Names}}]' | fzf --border=none --layout=reverse | awk '{print $1}')
  docker logs $CONTAINER -f
}

# Clear logs from container
dlogclear() {
  h2 "Clearing logs for container '$1'..."
  sudo sh -c "truncate -s 0 $(docker inspect --format='{{.LogPath}}' $1)"
}
