
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# load custom executable functions
# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings "$HOME/.zsh/configs"

# Env
[[ -f ~/.env ]] && source ~/.env

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

ZSH_THEME="af-magic"

plugins=(
  rails
  ruby
  git
  nvm
)

# general ruby scripts
export PATH="$HOME/.scripts/ruby/scripts"

# ruby scripts for procore
export PATH="$HOME/.scripts/ruby/scripts/procore"


# path to node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# add bash functions
[[ -f ~/.functions ]] && source ~/.functions

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# postgresql
# Not using the Mac OS installed
# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin"

#Use brew install versions
# export PATH=/usr/local/opt/postgresql@9.6/bin/:$PATH
export PATH=/usr/local/opt/postgresql@10/bin/:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# add bash functions
[[ -f ~/.functions ]] && source ~/.functions

# python
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
