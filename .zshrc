echo "Loading ZSHRC from dotfiles"
# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu


# Path to your oh-my-zsh installation.
if [[ ":$ZSH:" == *"$HOME/.oh-my-zsh"* ]]; then
  echo "ZSH set to $HOME/.oh-my-zsh"
else
  export ZSH=$HOME/.oh-my-zsh
fi

export OBSIDIAN_VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/my_ken"
export OBSIDIAN_PLUGINS="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/my_ken/.obsidian/plugins"
# Zsh History setup
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

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

export EDITOR='vim'
export PATH=$PATH:/usr/bin/openssl
export SBT_HOME=/Users/jplatta/.asdf/shims/sbt
export PATH=$PATH:$SBT_HOME/bin

export ASDF_HOME=$HOME/.asdf
source $ASDF_HOME/asdf.sh
source $ASDF_HOME/completions/asdf.bash

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fuzzy find
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# source $ZSH/oh-my-zsh.sh
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# git
[ -s "/Users/josephplatta/.scm_breeze/scm_breeze.sh" ] && source "/Users/josephplatta/.scm_breeze/scm_breeze.sh"

source <(kubectl completion zsh);
export KERL_BUILD_DOCS=yes

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jplatta/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jplatta/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jplatta/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jplatta/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<