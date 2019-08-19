# Aliases

alias q=’exit’
alias c=’clear’
alias h=’history’
alias cs=’clear;ls’
alias p=’cat’
alias lsa=’ls -a’
alias lsl=’ls -l’
alias t=’time’
alias k='kill'
alias null=’/dev/null’

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

export EDITOR=vim
export GREP_OPTIONS=' — color=auto'

[[ -f $HOME/.env ]] && source $HOME/.env

if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
  echo "PATH includes $HOME/bin"
  echo
else
  export PATH=$PATH:$HOME/bin
fi