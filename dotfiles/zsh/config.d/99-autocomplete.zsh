autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

complete -o nospace -C /usr/bin/vault vault

autoload -U add-zsh-hook

[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)
PROG=ledo _CLI_ZSH_AUTOCOMPLETE_HACK=1 source "/home/vertisan/.config/ledo/autocomplete.zsh"
