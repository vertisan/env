dstart() {
  h2 "Starting project '$1'..."

  COMPOSE_SELECTION=""
  COMPOSES=(
    "docker-compose.vrs.yml"
    "docker/docker-compose.vrs.yml"
    "docker-compose.yml"
    "docker/docker-compose.yml"
  )

  for i in "${COMPOSES[@]}"; do
    if [ -f "./$i" ]; then
      COMPOSE_SELECTION=$i
      break
    fi
  done

  if [ ! "$COMPOSE_SELECTION" = "" ]; then
    h2 "Using compose: '${COMPOSE_SELECTION}'"

    if [ "$1" != "" ]; then
      docker-compose -p $1 -f "${COMPOSE_SELECTION}" up -d $2 && ds
    else
      docker-compose -f "${COMPOSE_SELECTION}" up -d $2 && ds
    fi
  else
    h2 "Cannot find any compose which matches of selected"
    IFS=$'\n'
    echo "${COMPOSES[@]}"
  fi
}
