vim-setup-all(){
  echo "implement vim setup all"
}

mkdir-vim(){
  DIRECTORY="$HOME/.vim"
  
  if [ ! -d "$DIRECTORY" ]; then
    mkdir "$HOME/.vim"
  fi
}

install-colorscheme(){
  git clone https://github.com/flazz/vim-colorschemes.git ~/.vim
}