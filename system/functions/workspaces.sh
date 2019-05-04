#!/bin/sh

new_workspace(){
  mkdir $HOME/repos/$1
  init_repo
  create_workspace $1
  # open_workspace $1
  code -a $HOME/repos/$1
}

create_workspace(){
  code -n $HOME/vsc_workspaces/$1.code-workspace
}

rm_workspace(){
  rm -rf $HOME/vsc_workspaces/$1.code-workspace
}

ls_workspaces(){
  ls $HOME/vsc_workspaces
}

init_repo(){
  echo "Implement git init repo"
  # cd $HOME/repos/$1
  # git init
}





