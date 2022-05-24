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

# Aliases
alias ssh="TERM=xterm ssh"

# Shell initializations
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/jbowdre/dotfiles/main/oh-my-posh/vpotato.minimal.omp.json')"
enable_poshtransientprompt
eval "$(mcfly init zsh)"
