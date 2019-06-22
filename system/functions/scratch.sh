#!/bin/sh

scratch-make(){
  echo "Creating ./scratch"
  echo
  
  mkdir ./scratch
  touch ./scratch/scratch.rb
  touch ./scratch/scratch.exs
  touch ./scratch/scratch.sql
  touch ./scratch/scratch.json
  touch ./scratch/scratch.sh
  
  echo "Created folder:"
  ls | grep scratch
  echo
  echo "with files:"
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