#!/bin/sh

#brew
echo 'install brew?[y/n]'

read ans
if [ ans == 'y' ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo 'skipping brew...'
fi
#cask
brew tap caskroom/cask
#bash completion
brew install bash-completion
#install iterm2
brew cask install iterm2
#rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable --ruby

#nvm

#gems

#asdf

#postgres

#xcode
xcode-select --install