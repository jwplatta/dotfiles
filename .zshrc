echo "Loading ZSHRC from dotfiles"
# Path to your oh-my-zsh installation.
if [[ ":$ZSH:" == *"$HOME/.oh-my-zsh"* ]]; then
  echo "ZSH set to $HOME/.oh-my-zsh"
else
  export ZSH=$HOME/.oh-my-zsh
fi

# Zsh History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

# Env
[[ -f $HOME/.env ]] && source $HOME/.env

# ZSH_THEME="af-magic"
# ZSH_THEME="platypus"
# ZSH_THEME="nebirhos"
ZSH_THEME="nicoulaj"

plugins=(
  asdf
  brew
  dash
  docker
  fzf
  git
  github
  kubectl
  man
  mix
  node
  npm
  nvm
  macos
  otp
  postgres
  python
  rails
  rake
  ruby
  tmux
  vagrant
  vagrant-prompt
  vscode
  xcode
  web-search
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# add bash functions
[[ -f $HOME/.functions ]] && source $HOME/.functions

# add postgres helper functions
[[ -f $HOME/.postgres_functions ]] && source $HOME/.postgres_functions

# fuzzy find
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

export EDITOR='vim'

# git
[ -s "/Users/josephplatta/.scm_breeze/scm_breeze.sh" ] && source "/Users/josephplatta/.scm_breeze/scm_breeze.sh"

# openssl
export PATH=$PATH:/usr/bin/openssl

# SBT
export SBT_HOME=/Users/jplatta/.asdf/shims/sbt
export PATH=$PATH:$SBT_HOME/bin


# kubernetes autocomplete
source <(kubectl completion zsh);

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# kerl
export KERL_BUILD_DOCS=yes

# asdf
export ASDF_HOME=$HOME/.asdf
source $ASDF_HOME/asdf.sh
source $ASDF_HOME/completions/asdf.bash

# Conda initialize
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(''$HOME'/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"

if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
