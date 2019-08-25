# Aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

export EDITOR=vim
export GREP_OPTIONS=' — color=auto'

[[ -f $HOME/.env ]] && source $HOME/.env

if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
  echo "PATH includes $HOME/bin"
  echo
else
  export PATH=$PATH:$HOME/bin
fi