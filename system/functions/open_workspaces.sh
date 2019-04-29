#!/bin/sh

source $HOME/dotfiles/system/functions/workspace_helpers.sh

open_notes(){
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

open_prc_notes(){
  code $HOME/vsc_workspaces/procore_notes.code-workspace
}

open_dotfiles(){
  code $HOME/vsc_workspaces/dotfiles.code-workspace
}

prc_ws(){
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

pit_ws(){
  code $HOME/vsc_workspaces/point_in_time_reporting.code-workspace
}

data_sci_ws(){
  code $HOME/vsc_workspaces/data_science_ws.code-workspace
}

playground_ws(){
  code $HOME/vsc_workspaces/playground_ws.code-workspace
}

js_le_tutorial_ws(){
  code $HOME/vsc_workspaces/js_le_tutorial_ws.code-workspace
}

ls_workspaces(){
  ls $HOME/vsc_workspaces
}

open_workspace(){
  code $HOME/vsc_workspaces/$1.code-workspace
}

open_notes(){
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

open_prc_notes(){
  code $HOME/vsc_workspaces/procore_notes.code-workspace
}

open_dotfiles(){
  code $HOME/vsc_workspaces/dotfiles.code-workspace
}

prc_ws(){
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

pit_ws(){
  code $HOME/vsc_workspaces/point_in_time_reporting.code-workspace
}

data_sci_ws(){
  code $HOME/vsc_workspaces/data_science_ws.code-workspace
}

playground_ws(){
  code $HOME/vsc_workspaces/playground_ws.code-workspace
}

js_le_tutorial_ws(){
  open_ws $HOME/vsc_workspaces/js_le_tutorial_ws.code-workspace
}
