ac () {
  if [ "$1" != "" ]; then
    export AWS_PROFILE=$1
  else
    export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)
  fi

  h2 "Connecting with profile '$AWS_PROFILE' ..."

  aws sts get-caller-identity
}

acd () {
  if [[ "${AWS_PROFILE}" == "" ]]; then
    h2 "You are not connected to any AWS profile."
    return 0
  else
    h2 "Disconnecting from '$AWS_PROFILE' ..."
    unset AWS_PROFILE
  fi
}
