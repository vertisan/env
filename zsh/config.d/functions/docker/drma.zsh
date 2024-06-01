drma() {
  h2 "Clearing containers ..."
  docker rm $(docker ps -q -a)
}
