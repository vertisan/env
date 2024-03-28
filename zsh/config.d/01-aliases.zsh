## ---------------------
## General
## ---------------------
alias now='date +"%T"'
alias cls='clear'
alias ll='ls -lah'
# alias pyformat="autopep8 $*"
alias ls="lsd"
alias cat="bat --paging=never $*"
alias man="tldr $*"

## ---------------------
## Git
## ---------------------
alias gca="git commit --ammend --no-edit"
alias gs="git status"
alias gp="git push -u origin HEAD"
alias gta="git add -A"
alias graph='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias clear_branches="git branch | grep -v \"master\|next\" | xargs git branch -D"
alias gl="git log --pretty='%Cred%h%Creset %C(blue)%an%Creset %Cgreen(%cr)%Creset -%C(auto)%d%Creset %s'"

## ---------------------
## Editor
## ---------------------
alias vim="nvim $*"
alias vi="nvim $*"
# alias ccat="pygmentize -g $*"

## ---------------------
## AWS
## ---------------------
alias awsl="awslocal $*"

## ---------------------
## K8S
## ---------------------
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
