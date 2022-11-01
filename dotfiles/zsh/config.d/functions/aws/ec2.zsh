ec2-list(){
  aws ec2 describe-instances \
    --filter "Name=instance-state-name,Values=running" \
    --query "Reservations[*].Instances[*].[PublicIpAddress, Tags[?Key=='Name'].Value|[0], LaunchTime, InstanceId]" \
    --output table
}

ec2-connect() {
  HOST=$(ec2-list | fzf | awk '{print $2}' |sed 's/|//')
  jssh $HOST
}
