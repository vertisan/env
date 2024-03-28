#######################################################
#    / ___   )(  ____ \|\     /|(  ____ )(  ____ \
#    \/   )  || (    \/| )   ( || (    )|| (    \/
#        /   )| (_____ | (___) || (____)|| |
#       /   / (_____  )|  ___  ||     __)| |
#      /   /        ) || (   ) || (\ (   | |
#  _  /   (_/\/\____) || )   ( || ) \ \__| (____/\
# (_)(_______/\_______)|/     \||/   \__/(_______/
#
# by VRS-Factory (MacOS Edition)
#######################################################

export VRS_ENV="$HOME/Environment"
export TERM=xterm-256color
export HYPHEN_INSENSITIVE="true"
export SSH_ENV="$HOME/.ssh/environment"
export DISABLE_MAGIC_FUNCTIONS=true
export ZPLUG_HOME=/opt/homebrew/opt/zplug
export ZSH="$HOME/.oh-my-zsh"
# export ZSH_THEME="powerlevel10k/powerlevel10k"
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv aws nvm direnv time)

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

declare -i term_width=50
h1() {
  declare border padding text
  border='\e[1;34m'"$(printf '=%.0s' $(seq 1 "$term_width"))"'\e[0m'
  padding="$(printf ' %.0s' $(seq 1 $(((term_width - $(wc -m <<<"$*")) / 2))))"
  text="\\e[1m$*\\e[0m"
  echo -e "$border"
  echo -e "${padding}${text}${padding}"
  echo -e "$border"
}
h2() {
  printf "\e[1;33m===>\e[37;1m $*\e[0m\n"
}
h3() {
  printf "\e[1;33m====>\e[37;1m $*\e[0m\n"
}

zshconfig() {
  h1 "Reloading ZSH ..."
  source ~/.zshrc
}

# source $ZPLUG_HOME/init.zsh
h1 "Initializing ZSH ..."
zmodload zsh/zprof
source $ZPLUG_HOME/init.zsh
# zplug "MichaelAquilina/zsh-autoswitch-virtualenv", from:oh-my-zsh
zplug "mafredri/zsh-async"
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/zsh-autosuggestions", from:oh-my-zsh
zplug "wting/autojump", hook-build: "./install.py"
zplug "lukechilds/zsh-nvm"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo
    zplug install
  fi
fi

fpath=(~/.zsh.d/ $fpath)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
plugins=(zsh-autosuggestions git autojump zsh-syntax-highlighting dnf npm ssh-agent fzf-tab)
zstyle ':completion:*' fzf-search-display true

#################

h1 "Initializing OMZ + p10k ..."
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

for conf in $(find "$VRS_ENV/zsh/config.d" -name "*.zsh"); do
  source "${conf}"
done
unset conf

source ~/.nvm/nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


#################

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

#add-zsh-hook chpwd load-nvmrc
#load-nvmrc

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault
