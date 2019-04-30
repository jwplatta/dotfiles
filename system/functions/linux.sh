#!/bin/sh

# Create a new directory and enter it
mk() {
  mkdir -p "$@" && cd "$@"
}

# Open man page as PDF
manpdf() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}