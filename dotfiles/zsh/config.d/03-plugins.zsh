zmodload zsh/zprof

fpath=(~/.zsh.d/ $fpath)

plugins=(zsh-nvm zsh-autosuggestions git docker docker-compose autojump zsh-syntax-highlighting dnf npm ssh-agent tmux fzf-tab)

zstyle ':completion:*' fzf-search-display true
