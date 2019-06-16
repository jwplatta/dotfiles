#!/bin/sh

ruby-check(){
  echo "checking ruby syntax"
  
  set -euo pipefail
  
  git diff --name-only --diff-filter=AM HEAD |
  grep ".*rb" |
  xargs bundle exec rubocop \
  --display-cop-names \
  --extra-details \
  --parallel \
}