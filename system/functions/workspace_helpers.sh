#!/bin/sh

new_workspace(){
  mkdir $HOME/repos/$1
  create_workspace $1
  # open_workspace $1
  code -a $HOME/repos/$1
}

create_workspace(){
  code -n $HOME/vsc_workspaces/$1.code-workspace
}

rm_workspace(){
  rm -rf $HOME/repos/$1
  rm -rf $HOME/vsc_workspaces/$1.code-workspace
}

ls_workspaces(){
  ls $HOME/vsc_workspaces
}

open_ws(){
  file=$1
  
  file_exists? $file
  check=$?
  
  if [ $check -eq 0 ]; then
    code $file
  fi
}

# file_exists?(){
#   FILE=$1
#   if [ -f $FILE ]; then
#     return 0
#   else
#     echo "Does not exist: $FILE"
#     return 1
#   fi
# }