dres() {
  h2 "Restarting container '$1'..."
  docker restart $1
  h2 "Restart completed."
}
