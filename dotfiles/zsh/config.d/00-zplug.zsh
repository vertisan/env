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
