HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep extendedglob notify
bindkey -v
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
PATH="$HOME/.local/bin:$PATH"

# Global aliases
alias ssh="TERM=xterm ssh"
alias sshpass="ssh -o PubkeyAuthentication=no"

# Import local aliases from ~/.zshalias, if present
if [ -f $HOME/.zshalias ]; then
  source $HOME/.zshalias
fi

# Shell initializations
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/jbowdre/dotfiles/main/oh-my-posh/vpotato.minimal.omp.json')"
enable_poshtransientprompt
eval "$(mcfly init zsh)"
