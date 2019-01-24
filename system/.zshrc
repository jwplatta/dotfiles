
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

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# add bash functions
[[ -f ~/.functions ]] && source ~/.functions

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh