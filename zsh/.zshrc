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
alias scppass="scp -o PubkeyAuthentication=no"
alias k="kubectl"
alias ll="ls -la"
alias ccat='egrep -v "^\s*(#|$)"'

# Import local prefs from ~/.zshlocal, if present
if [ -f $HOME/.zshlocal ]; then
  source $HOME/.zshlocal
fi

# Shell initializations
if type oh-my-posh > /dev/null; then
  eval "$(oh-my-posh init zsh --config '~/.dotfiles/oh-my-posh/vpotato.minimal.omp.json')"
  enable_poshtransientprompt
fi
if type mcfly > /dev/null; then
  eval "$(mcfly init zsh)"
fi
eval "$(ssh-agent)"
ssh-add ~/.ssh/id_ed25519


