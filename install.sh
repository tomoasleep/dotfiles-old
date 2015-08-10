#!/bin/sh
DOTFILES=$(dirname $0)

do_script() {
  local target=${1}.sh
  echo "-- Execute $target --"
  source $DOTFILES/scripts/$target
}

do_script submodules
do_script symlink
do_script install_anyenv
do_script install_atom
