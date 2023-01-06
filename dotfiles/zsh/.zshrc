#######################################################
#    / ___   )(  ____ \|\     /|(  ____ )(  ____ \
#    \/   )  || (    \/| )   ( || (    )|| (    \/
#        /   )| (_____ | (___) || (____)|| |
#       /   / (_____  )|  ___  ||     __)| |
#      /   /        ) || (   ) || (\ (   | |
#  _  /   (_/\/\____) || )   ( || ) \ \__| (____/\
# (_)(_______/\_______)|/     \||/   \__/(_______/
#
# by VRS-Factory
#######################################################

#### Core, let's load it first!
export VRS_ENV="$HOME/Environment"
export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export ZSH_THEME="powerlevel10k/powerlevel10k"
export HYPHEN_INSENSITIVE="true"
export SSH_ENV="$HOME/.ssh/environment"
export DISABLE_MAGIC_FUNCTIONS=true
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export DISABLE_UNTRACKED_FILES_DIRTY=true
export XDG_CURRENT_DESKTOP=sway
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

declare -i term_width=120
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



h1 "Initializing ZSH ..."
zmodload zsh/zprof
source ~/.zplug/init.zsh
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
plugins=(zsh-nvm zsh-autosuggestions git docker docker-compose autojump zsh-syntax-highlighting dnf npm ssh-agent tmux fzf-tab)
zstyle ':completion:*' fzf-search-display true

#################

h1 "Initializing OMZ + p10k ..."
source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh




#### Now, let's load all of the stuff and make some awesome :D
umask u=rwx,g=rx,o=r

for conf in $(find "$VRS_ENV/dotfiles/zsh/config.d" -name "*.zsh"); do
  # h2 "Loading config '${conf}' for ZSH..."
  source "${conf}"
done
unset conf


source ~/.nvm/nvm.sh
