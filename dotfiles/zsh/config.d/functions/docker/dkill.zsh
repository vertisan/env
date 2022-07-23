dkill() {

  if [ "$1" != "" ]; then
    h2 "Killing container '$1'..."
    docker kill $1
  else
    h2 "Killing all containers ..."
    docker kill $(docker ps -q)
  fi
}
