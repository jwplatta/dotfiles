#!/bin/sh

form-rb(){
  echo "checking ruby syntax for ruby files"
  
  set -euo pipefail
  
  git diff --name-only --diff-filter=AM master |
  grep ".*rb" |
  xargs bundle exec rubocop \
  --auto-correct \
  --display-cop-names \
  --extra-details \
}

form-rk(){
  echo "checking ruby syntax for rake files"
  
  set -euo pipefail
  
  git diff --name-only --diff-filter=AM master |
  grep ".*rake" |
  xargs bundle exec rubocop \
  --auto-correct \
  --display-cop-names \
  --extra-details \
}