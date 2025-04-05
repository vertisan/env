## ---------------------
## G E N E R A L
## ---------------------
alias now='date +"%T"'
alias cls='clear'
alias ll='ls -lah'
# alias pyformat="autopep8 $*"
alias ls="lsd"
alias cat="bat --paging=never $*"
alias man="tldr $*"
alias pf="fzf --preview='bat --paging=never --color=always --style=numbers {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"


## ---------------------
## G I T
## ---------------------
alias gca="git commit --ammend --no-edit"
alias gs="git status"
alias gp="git push -u origin HEAD"
alias gta="git add -A"
alias graph='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias clear_branches="git branch | grep -v \"master\|main\" | xargs git branch -D"
alias gl="git log --pretty='%Cred%h%Creset %C(blue)%an%Creset %Cgreen(%cr)%Creset -%C(auto)%d%Creset %s'"


## ---------------------
## E D I T O R
## ---------------------
alias vim="nvim $*"
alias vi="nvim $*"
# alias ccat="pygmentize -g $*"


## ---------------------
## A W S
## ---------------------
alias awsl="awslocal $*"


## ---------------------
## K U B E R N E T E S
## ---------------------
# alias kubectl="kubecolor"
alias k="kubectl $*"
alias eks="eksctl $*"
alias ka="kubectl apply -f $*"
alias kg="kubectl get $*"
alias kd="kubectl describe $*"
alias ke="kubectl exec -it $*"
alias klo="kubectl logs -f $*"
alias kdel="kubectl delete -f $*"
alias kn='kubectl config set current-context '
alias kns='kubectl config set-context --current --namespace'


## ---------------------
## M U L T I P A S S
## ---------------------
alias mp="multipass $*"


## ---------------------
## A N S I B L E
## ---------------------
alias ap="ansible-playbook $*"


## ---------------------
## G C L O U D
## ---------------------
alias gcp="gcloud $*"
