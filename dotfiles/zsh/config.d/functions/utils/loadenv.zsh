loadenv() {
  if [ "$1" != "" ]; then
    h2 "Loading env from '$1'..."
    ENV=$1
  else
    h2 "Loading env from '.env'..."
    ENV=.env
  fi

  export $(cat $ENV | xargs)
}
