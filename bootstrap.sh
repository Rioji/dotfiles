#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE}")";

#
# Homebrew
#
if test ! $(which brew); then
  echo "Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#
# Utilities
#
brew install git

git config --global core.excludesfile ~/.gitignore_global
cp ./git/gitignore_global ~/.gitignore_global

exit 0