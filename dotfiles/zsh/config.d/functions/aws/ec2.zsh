ec2-list(){
  if [[ "${AWS_PROFILE}" == "" ]]; then
    h2 "The AWS_PROFILE is not available!"
    return 1
  fi

  aws ec2 describe-instances \
    --filter "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].[PublicIpAddress, PrivateIpAddress, Tags[?Key=='Name'].Value|[0], LaunchTime, InstanceId]" \
    --output table
}

ec2-connect() {
  if [[ "${AWS_PROFILE}" == "" ]]; then
    h2 "The AWS_PROFILE is not available!"
    return 1
  fi

  HOST=$(ec2-list | fzf --layout=reverse --border=none  | awk '{print $2}' |sed 's/|//')
  USER=$(gum choose "ec2-user" "admin" "ubuntu" "bitnami")
  jssh $USER@$HOST
}

jz-connect() {
  if [ "$1" != "" ]; then
    HOST=$1
  else
    HOST=$(jz hosts list | fzf | awk '{print $4}')
  fi

  if [ "$HOST" != "" ]; then
    h2 "Connecting with '$HOST'..."
    jssh $HOST
  else
    h2 "No host has been selected!"
  fi
}

