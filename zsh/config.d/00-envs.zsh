## General
export HISTTIMEFORMAT="%d/%m/%y %T "
export PATH=$PATH:$HOME/Library/Application\ Support/JetBrains/Toolbox/scripts/
export PATH=$PATH:$HOME/.local/bin/
export PATH="$PATH:/opt/homebrew/opt/postgresql@15/bin"
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.12/bin"
export PATH="$PATH:$HOME/.krew/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.sonar-scanner/bin"

### Google Cloud
if [ -f '/Users/vertisan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vertisan/google-cloud-sdk/path.zsh.inc'; fi

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
export KUBE_EDITOR=nvim

## Vault
export VAULT_ADDR="https://vlt.vrsf.in"
# export VAULT_SKIP_VERIFY=1 # Required due to too long certificates TTL

## Consul
export CONSUL_HTTP_ADDR="https://consul.vrsf.in"

## Docker
export DOCKER_DEFAULT_PLATFORM="linux/amd64"
