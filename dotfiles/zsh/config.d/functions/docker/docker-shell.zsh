dbash() {
  h2 "Knock, knock bash for '$1'..."
  USER="root"

  if [ "$2" != "" ]; then
    USER=$2
  fi

  docker exec -it -u $USER $1 bash -c "stty cols $COLUMNS rows $LINES && bash"
}

# Enter into container Sh
dsh() {
  h2 "Knock, knock sh for '$1'..."
  USER="root"

  if [ "$2" != "" ]; then
    USER=$2
  fi

  docker exec -it -u $USER $1 sh -c "stty cols $COLUMNS rows $LINES && sh"
}
