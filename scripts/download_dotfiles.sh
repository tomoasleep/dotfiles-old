#!/bin/sh

check_git () {
  if which git; then; return; fi
  if which brew; then; brew install git; return; fi
  if which apt; then; sudo apt install -y git; return; fi
  if which pacman; then; sudo pacman -S git; return; fi
}

check_git
git clone git@github.com:tomoasleep/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
