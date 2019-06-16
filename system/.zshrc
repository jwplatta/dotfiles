
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

ZSH_THEME="af-magic"

plugins=(
  rails
  ruby
  git
  nvm
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

# postgresql
# Not using the Mac OS installed
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"

#Use brew install versions
# export PATH=/usr/local/opt/postgresql@9.6/bin/:$PATH
export PATH=/usr/local/opt/postgresql@10/bin/:$PATH

# git
[ -s "/Users/josephplatta/.scm_breeze/scm_breeze.sh" ] && source "/Users/josephplatta/.scm_breeze/scm_breeze.sh"

# anaconda
export PATH=$HOME/anaconda3/bin:$PATH

# openssl
export PATH=/usr/local/openssl/bin:$PATH
export MANPATH=/usr/local/openssl/share/man:$MANPATH

# python
if [[ ":$PATH:" == *"$HOME/.pyenv/shims:"* ]]; then
  echo "PATH includes ~/.pyenv/shims:"
  echo
else
  eval "$(pyenv init -)"
fi
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# Ruby Version Manager
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# rust/carge
source $HOME/.cargo/bin

# kubernetes autocomplete
source <(kubectl completion zsh);

# kerl
export KERL_BUILD_DOCS=yes
echo $KERL_BUILD_DOCS

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash