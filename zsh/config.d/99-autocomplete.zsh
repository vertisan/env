autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
complete -o nospace -C /opt/homebrew/bin/terraform tf
complete -o nospace -C /opt/homebrew/bin/vault vault

complete -C '/usr/local/bin/aws_completer' aws

autoload -U add-zsh-hook

[[ /opt/homebrew/bin/kubectl ]] && source <(kubectl completion zsh)
