#!/bin/sh

print_aliases() {
    while read p; do
        echo "$p"
    done <$HOME/.aliases
}

git_aliases() {
    while read p; do
        echo "$p"
    done <$HOME/.new_aliases/git
}

test_fun() {
    echo "test works!"
}