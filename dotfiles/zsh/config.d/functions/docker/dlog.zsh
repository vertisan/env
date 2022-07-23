dlog() {
  h2 "Getting logs for container '$1'..."
  docker logs $1 -f
}

# Clear logs from container
dlogclear() {
  h2 "Clearing logs for container '$1'..."
  sudo sh -c "truncate -s 0 $(docker inspect --format='{{.LogPath}}' $1)"
}
