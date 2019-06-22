
make-scratch(){
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

cleanup-scratch(){
  if [ -d "./scratch" ]; then
    note-from-scratch
    rm -rf ./scratch
  else
    echo "./scratch does not exist."
  fi
}

note-from-stch(){
  echo -n "Creating note from scratch? (y/n)"
  read ans
  echo $ans
}

scratch-exist(){
  if [ -d ".scratch" ]; then
    echo "./scratch exists"
  else
    echo -n "Create scratch?"
    echo
    read ans
    if [ "$ans" = "y" ]; then
      echo "Creating ./scratch"
    else
      echo "Not creating ./scratch"
    fi
  fi
}