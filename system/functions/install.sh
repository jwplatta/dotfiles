#!/bin/sh

install-asdf-plgns(){
  asdf-erlang-plgn
  asdf-elixir-plgn
  asdf-ruby-plgn
  asdf-postgres-plgn
  asdf-python3-plgn
  asdf-nodejs-plgn
}

install-tools(){
  install-python
  install-postgres
  install-ruby
  install-erlang
  install-elixir
}

asdf-erlang-plgn(){
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
}

asdf-elixir-plgn(){
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
}

asdf-ruby-plgn(){
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
}

asdf-postgres-plgn(){
  asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
}

asdf-python3-plgn(){
  asdf plugin-add python https://github.com/danhper/asdf-python.git
}

asdf-nodejs-plgn(){
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
}

install-python(){
  if [ -z "$1" ]
  then
    asdf install python 3.7.2
  else
    asdf install python "$1"
  fi
}

install-erlang(){
  if [ -z "$1" ]
  then
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
    asdf install erlang 21.3
  else
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
    asdf install erlang $1
  fi
}

install-elixir(){
  if [ -z "$1" ]
  then
    asdf install elixir 1.8.1
  else
    asdf install elixir "$1"
  fi
}

install-ruby(){
  if [ -z "$1" ]
  then
    asfd install ruby 2.6.3
  else
    asfd install ruby "$1"
  fi
}

install-postgres(){
  if [ -z "$1" ] || [ -z "$2"]
  then
    asdf install postgres 10.7
  else
    asdf install postgres "$1"
  fi
}

install-nodejs(){
  if [ -z "$1"]
  then
    asdf install nodejs 10.15.3
  else
    asdf install nodejs "$1"
  fi
}