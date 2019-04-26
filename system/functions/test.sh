#!/bin/sh

function print_aliases() {
  while read p; do
    echo "$p"
  done <$HOME/.aliases
}

function git_aliases() {
  while read p; do
    echo "$p"
  done <$HOME/.new_aliases/git
}

function test_fun() {
  echo "test function works!"
}