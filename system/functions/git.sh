link_gitconfig(){
  cat $HOME/dotfiles/git/gitconfig
  
  echo ""
  echo "Make above gitconfig global?[y/n]"
  read answer
  
  if [ $answer == "y" ]; then
    ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
    echo "gitconfig linked"
  else
    echo "Not linking gitconfig"
  fi
}

link_global_gitignore(){
  ln -sf $HOME/dotfiles/git/gitignore_global $HOME/.gitignore_global
  echo "global_gitignore linked"
}

link-git-hooks(){
  ln -sf $HOME/dotfiles/git/hooks/ruby-pre-commit "$1"
  
  echo "git hooks linked"
}