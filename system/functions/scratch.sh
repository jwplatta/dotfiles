#!/bin/sh

scrx-mk(){
  echo "Creating ./scratch\n"
  
  mkdir ./scratch
  touch ./scratch/scratch.rb
  touch ./scratch/scratch.exs
  touch ./scratch/scratch.sql
  touch ./scratch/scratch.json
  touch ./scratch/scratch.sh
  
  echo "Created folder:\n"
  ls | grep scratch
  
  echo "\nwith files:\n"
  ls scratch
  
  cd ./scratch
}

scrx-cln(){
  echo "Are you sure you want to delete ./scratch?(y/n)\n\n"
  read ans
  
  if [ "$ans" = "y" ]; then
    if [ -d "./scratch" ]; then
      rm -rf ./scratch
      echo "./scratch removed."
    else
      echo "./scratch does not exist."
    fi
  else
    echo "Exiting"
  fi
}

scrx-xst(){
  if [ -d "./scratch" ]; then
    echo "./scratch exists"
  else
    echo "/.scratch does not exist."
    echo -n "Create scratch?\n\n"
    read ans
    if [ "$ans" = "y" ]; then
      scrx-mk
    else
      echo "Not creating ./scratch"
    fi
  fi
}

scrx-note(){
  echo "Creating note"
  loc=$PWD
  echo $loc
  
  currdir=${PWD##*/}
  if [ "$currdir" = "scratch" ]; then
    echo "current directory is scratch"
  else
    echo "curent directory is not scratch"
  fi
  
  files=($PWD/*)
  COUNTER=0
  
  declare -A index_files
  
  for i in "${files[@]}"
  do
    index_files[$COUNTER]+=$i
    let COUNTER=$COUNTER+1
  done
  
  for k in ""${(@k)index_files}""
  do
    echo "[$k] ${index_files[$k]}"
  done
  echo
  echo "Which scratch file do you want to turn into a note?\n\n"
  read file_index
  
  echo "${index_files[$file_index]}"
  
  $HOME/dotfiles/notetaker/bin/run "$index_files[$file_index]"
}