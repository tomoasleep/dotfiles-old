#!/bin/sh
DOTFILES=$(dirname $0)

do_script() {
  echo "-- Execute $1 --"
  source $DOTFILES/scripts/$1
}

do_script symlinks.sh
