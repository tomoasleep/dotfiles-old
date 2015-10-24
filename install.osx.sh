#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install zsh tmux tig git macvim
brew install caskroom/cask/brew-cask

brew cask install atom iterm2 dropbox sequel-pro google-chrome google-japanese-ime keepassx karabiner slack seil spectacle vagrant virtualbox
