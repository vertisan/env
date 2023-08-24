export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export KUBE_EDITOR=nvim

## GPG
export KEYID=CC836A50CF78C685CA80EBC7D1DD451A7D77EBA3
export GNUPGHOME=~/.gnupg
export GPG_TTY=$(tty)

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
# These paths go always last!
export PATH="/${HOME}/go/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
export PATH="/${HOME}/bin:$PATH"
export PATH="/${HOME}/.npm-global/bin:$PATH"
export PATH="/${HOME}/.yarn/bin:$PATH"
export PATH="$PATH:/${HOME}/.pyenv/bin"
export NET_WIRED_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`
export PYTHONPATH=~/.local/lib/python3.8/site-packages
export VAULT_ADDR=https://vlt.jazzy.pro
export HISTTIMEFORMAT="%d/%m/%y %T "
