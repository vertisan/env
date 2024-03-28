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

# ec2-connect() {
#   if [[ "${AWS_PROFILE}" == "" ]]; then
#     h2 "The AWS_PROFILE is not available!"
#     return 1
#   fi

#   HOST=$(ec2-list | fzf --layout=reverse --border=none  | awk '{print $2}' |sed 's/|//')
#   if [ "$HOST" != "" ]; then
#     USER=$(gum choose "ec2-user" "admin" "ubuntu" "bitnami")
#     PORT=$(gum choose "65522" "22")
#     jssh $USER@$HOST --port $PORT
#   else
#     h2 "No host has been selected!"
#   fi
# }
