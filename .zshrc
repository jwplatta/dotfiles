echo "Loading ZSHRC from dotfiles"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
  echo "PATH includes $HOME/bin"
  echo
else
  export PATH=$PATH:$HOME/bin
fi

# Path to your oh-my-zsh installation.
if [[ ":$ZSH:" == *"$HOME/.oh-my-zsh"* ]]; then
  echo "ZSH set to $HOME/.oh-my-zsh"
  echo
else
  export ZSH=$HOME/.oh-my-zsh
fi

# load custom executable functions
# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
# _load_settings "$HOME/.zsh/configs"

# Env
[[ -f $HOME/.env ]] && source $HOME/.env

# Local config
# [[ -f $HOME/dotfiles/system/.zshrc.local ]] && source ~$HOME/dotfiles/system/.zshrc.local
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# ZSH_THEME="af-magic"
# ZSH_THEME="platypus"
# ZSH_THEME="nebirhos"
ZSH_THEME="nicoulaj"

plugins=(
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
  osx
  otp
  postgres
  pyenv
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

# general ruby scripts
# export PATH="$HOME/.scripts/ruby/scripts"

# ruby scripts for procore
# export PATH="$HOME/.scripts/ruby/scripts/procore"

# Node version manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases
# [[ -f $HOME/dotfiles/system/.aliases ]] && source $HOME/dotfiles/system/.aliases

# add bash functions
[[ -f $HOME/.functions ]] && source $HOME/.functions

# add postgres helper functions
[[ -f $HOME/.postgres_functions ]] && source $HOME/.postgres_functions

# [[ -f $HOME/dotfiles/system/.functions ]] && source $HOME/dotfiles/system/.functions

# fuzzy find
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

export EDITOR='vim'

# postgresql
# Not using the Mac OS installed
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"

#Use brew install versions
# export PATH=/usr/local/opt/postgresql@9.6/bin/:$PATH
# export PATH=/usr/local/opt/postgresql@10/bin/:$PATH

# git
[ -s "/Users/josephplatta/.scm_breeze/scm_breeze.sh" ] && source "/Users/josephplatta/.scm_breeze/scm_breeze.sh"

# openssl
export PATH=/usr/local/openssl/bin:$PATH
export MANPATH=/usr/local/openssl/share/man:$MANPATH

# SBT
export SBT_HOME=/Users/jplatta/.asdf/shims/sbt
export PATH=$PATH:$SBT_HOME/bin

# python
# if [[ ":$PATH:" == *"$HOME/.pyenv/shims:"* ]]; then
#   echo "PATH includes ~/.pyenv/shims:"
#   echo
# else
#   eval "$(pyenv init -)"
# fi

# kubernetes autocomplete
source <(kubectl completion zsh);

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# kerl
export KERL_BUILD_DOCS=yes

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# >>> conda initialize >>>
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
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
