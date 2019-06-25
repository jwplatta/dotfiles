#!/bin/sh

scratch-make(){
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
}

scratch-cleanup(){
  if [ -d "./scratch" ]; then
    echo -n "Create note from scratch? (y/n)\n\n"
    read ans
    
    if [ "$ans" = "y" ]; then
      scratch-to-note
    fi
    
    rm -rf ./scratch
  else
    echo "./scratch does not exist."
  fi
}

scratch-to-note(){
  echo "Creating note"
  loc = $PWD
}

scratch-exist(){
  if [ -d "./scratch" ]; then
    echo "./scratch exists"
  else
    echo "/.scratch does not exist."
    echo -n "Create scratch?\n\n"
    read ans
    if [ "$ans" = "y" ]; then
      scratch-make
    else
      echo "Not creating ./scratch"
    fi
  fi
}

test-scratch(){
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
    echo $COUNTER
    let COUNTER=$COUNTER+1
  done
  
  echo $index_files[3]
  
  for k in ""${(@k)index_files}""
  do
    echo "[$k] ${index_files[$k]}"
  done
  
  echo "Select file:"
  read file_index
  
  echo "${index_files[$file_index]}"
  
  /Users/jplatta/dotfiles/notetaker/lib/note_writer.rb "$index_files[$file_index]"
  
  vim "$HOME/dotfiles/scratch/code_note_one.md"
}