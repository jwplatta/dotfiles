#!/bin/sh

source $HOME/dotfiles/system/functions/workspace_helpers.sh

ws-notes(){
  if [ -z "$1" ]; then
    code $HOME/vsc_workspaces/dev_notes.code-workspace
  else
    files=($(find $HOME/dev_notes -type f -name "*$1*"))
    for ((i=0; i<=${#files[@]}; i++)); do
      echo "[$i] ${files[$i]}"
    done
    
    echo
    echo "Enter file index: "
    echo
    
    read file_number
    
    code $HOME/vsc_workspaces/dev_notes.code-workspace
    code ${files[$file_number]}
  fi
}

ws-prc-notes(){
  code $HOME/vsc_workspaces/procore_notes.code-workspace
}

ws-df(){
  code $HOME/vsc_workspaces/dotfiles.code-workspace
}

ws-prc(){
  code $HOME/vsc_workspaces/procore_app.code-workspace
  
  # if [ -z $1 ]; then
  # else
  # files=($(find $HOME/procore -type f -name "*$1*"))
  # echo $files
  # for ((i=0; i<=${#files[@]}; i++)); do
  #   echo "[$i] ${files[$i]}"
  # done
  
  # echo
  # echo "Enter file index: "
  # echo
  
  # read file_index
  
  # code $HOME/vsc_workspaces/procore_app.code-workspace
  # code ${files[$file_index]}
  # fi
}

ws-prc-rpt(){
  code $HOME/vsc_workspaces/point_in_time_reporting.code-workspace
}

ws-data-sci(){
  code $HOME/vsc_workspaces/data_science_ws.code-workspace
}

ws-playground(){
  code $HOME/vsc_workspaces/playground_ws.code-workspace
}

ws-js-le(){
  code $HOME/vsc_workspaces/js_le_tutorial_ws.code-workspace
}

ws-lss(){
  ls $HOME/vsc_workspaces
}

ws-open(){
  code $HOME/vsc_workspaces/$1.code-workspace
}

# TODO: remove
ws-notes-old(){
  if [ -z "$1" ]; then
    code $HOME/vsc_workspaces/dev_notes.code-workspace
  else
    files=($(find $HOME/dev_notes -type f -name "*$1*"))
    for ((i=0; i<=${#files[@]}; i++)); do
      echo "[$i] ${files[$i]}"
    done
    
    echo
    echo "Enter file index: "
    echo
    
    read file_number
    
    code $HOME/vsc_workspaces/dev_notes.code-workspace
    code ${files[$file_number]}
  fi
}