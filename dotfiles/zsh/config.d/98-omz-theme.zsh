function prompt_jzmode() {
    if [ -f .jz-mode ]; then
      p10k segment -b red -f white -t "JzCLI: $(cat .jz-mode)"
    fi
}


function prompt_docker_host() {
  p10k segment -f 208 -t "${DOCKER_HOST}"
}

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv docker_host jzmode aws nvm direnv) # time
