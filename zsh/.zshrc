# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/john/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias ssh="TERM=xterm ssh"

# Shell initializations
eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/jbowdre/dotfiles/main/oh-my-posh/vpotato.minimal.omp.json')"
enable_poshtransientprompt
eval "$(mcfly init zsh)"
