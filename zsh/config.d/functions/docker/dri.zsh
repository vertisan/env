dri() {
  h2 "Removing all docker images..."
  docker rmi $(docker images -q)
}
