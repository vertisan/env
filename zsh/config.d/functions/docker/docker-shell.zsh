dshell() { 
  if [ -z "$1" ]; then
    CONTAINER=$(docker ps --format='{{.ID}} [{{.Names}}]' | fzf --border=none --layout=reverse | awk '{print $1}')
    USER=$(gum choose "root [0]" "$(whoami) [$(id -u)]" | awk '{print $2}' | tr -d '[]')
    SHELL=$(gum choose "bash" "sh")
  else
    CONTAINER=$1
    [ "$2" != "" ] && USER=$2 || USER="root" 
    [ "$3" != "" ] && SHELL=$3 || SHELL="sh" 
  fi

  h2 "Knock, knock bash for '$CONTAINER' as '$USER'..."

  docker exec -it -u $USER $CONTAINER $SHELL -c "stty cols $COLUMNS rows $LINES && $SHELL"
}

dbash() {
  dshell $1 $2 "bash"
}

dsh() {
  dshell $1 $2 "sh"
}
