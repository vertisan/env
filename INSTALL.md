##

## ZSH

```
brew install zplug powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Tools

```
brew tap hashicorp/tap
brew tap homebrew/cask-fonts

brew install azure-cli fzf jnv jq yq pyenv k9s kubectl neovim azure-cli font-hack-nerd-font hashicorp/tap/vault hashicorp/tap/terraform hashicorp/tap/packer lsd git-delta bat go tldr
```

### Exceptions

| Tool       | Installation                                                                  |
| ---------- | ----------------------------------------------------------------------------- |
| AWS CLI v2 | https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html |
| Python     | https://www.python.org/downloads/macos/                                       |
| GCloud CLI | https://cloud.google.com/sdk/docs/install                                     |
