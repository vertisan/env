alias gc="echo '>> I think you mean: commit \"<commit_message>\"'"
alias gca="git commit --ammend --no-edit"
alias gs="git status"
alias gp="git push -u origin HEAD"
alias gta="git add -A"
alias graph='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias clear_branches="git branch | grep -v \"master\|next\" | xargs git branch -D"
alias now='date +"%T"'
alias ports='netstat -tulanp'
alias cls='clear'
alias set_php='sudo update-alternatives --config php'
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias ram='free -m -l -t'
#alias t="tmux new -s $(date +%s)"
alias phpcs='~/.config/composer/vendor/bin/phpcs'
alias phpcbf='~/.config/composer/vendor/bin/phpcbf'
alias ll='ls -lah'
alias gl="git log --pretty='%Cred%h%Creset %C(blue)%an%Creset %Cgreen(%cr)%Creset -%C(auto)%d%Creset %s'"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias mip="curl ipinfo.io"
alias vi="nvim $*"
alias ov3="openvpn3 $*"
alias pyformat="autopep8 $*"
alias ls="lsd"
alias img="imv $*"
alias copy="wl-copy < $*"
alias bt="bluetoothctl $*"
alias btc="bluetoothctl connect $*"
#alias cp="rsync -avh $*"

## ---------------------
## Editor
## ---------------------
alias vim="nvim $*"
alias vi="nvim $*"
alias ccat="pygmentize -g $*"

## ---------------------
## Docker
## ---------------------
alias dip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $*"
alias ds="docker ps --format \"table {{.ID}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}\""
alias dsa="docker ps --format \"table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}\" -a"
alias dprune="docker system prune --all --force"

## ---------------------
## Terraform
## ---------------------
alias tf="terraform $*"
alias tfp="terraform plan $*"
alias tfv="terraform validate $*"
alias tfa="terraform apply $*"
alias tfd="terraform destroy $*"

## ---------------------
## AWS
## ---------------------
alias awsl="awslocal $*"

## ---------------------
## K8S
## ---------------------
alias k="kubectl $*"
