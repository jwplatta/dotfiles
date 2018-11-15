# load custom executable functions
# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.

_load_settings "$HOME/.zsh/configs"

source $ZSH/oh-my-zsh.sh

# local config 
[[ -f ~/.zshrc.local]] && source ~/.zshrc.local

# aliases
[[-f ~/.aliases]] && source ~/.aliases

# zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh