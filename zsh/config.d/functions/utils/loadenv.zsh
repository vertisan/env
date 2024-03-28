loadenv() {
  if [ "$1" != "" ]; then
    h2 "Loading env from '$1'..."
    ENV=$1
  else
    h2 "Loading env from '.env'..."
    ENV=.env
  fi

  cat $ENV
  export $(grep -v '^#' $ENV | xargs) 
  #export $(cat $ENV | xargs)
}
