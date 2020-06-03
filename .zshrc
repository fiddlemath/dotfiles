# Path to the oh-my-zsh installation.
export ZSH="/Users/fiddle/.oh-my-zsh"
ZSH_THEME="fiddlemath"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-machine docker-compose yarn)

source $ZSH/oh-my-zsh.sh

# User configuration
. ~/.sh-vars

# Gcloud tab completion
source ~/.local/google-cloud-sdk/*.zsh.inc

# kubectl tab completion
source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k
