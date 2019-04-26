
function open_notes(){
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

function open_prc_notes(){
  code $HOME/vsc_workspaces/procore_notes.code-workspace
}

function open_dotfiles(){
  code $HOME/vsc_workspaces/dotfiles.code-workspace
}

function prc_ws(){
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

function pit_ws(){
  code $HOME/vsc_workspaces/point_in_time_reporting.code-workspace
}

function open_workspace(){
  workspace = $1
  echo "Implement me so I can open $workspace"
}

function data_sci_ws(){
  code $HOME/vsc_workspaces/data_science_ws.code-workspace
}