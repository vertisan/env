## General
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH=$PATH:$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts/
export PATH=$PATH:$HOME/.local/bin/

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## GPG
export KEY_ID=547C688EF2BC5035A5970B09645DE7B9D00369CE
export KEY_SECRET_ID=645DE7B9D00369CE
export GNUPGHOME=~/.gnupg
export GPG_TTY=$(tty)

## NVM
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## K8s
export KUBE_EDITOR=vim

## Vault
export VAULT_ADDR="http://10.0.69.10:10120"

## Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64
