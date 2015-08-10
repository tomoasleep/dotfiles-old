#!/bin/sh

local_install() {
  local package=$1
  [[ ! -d $HOME/.atom/local-packages/$package ]] && git clone git@bitbucket.org:nemunemu/${package}.git $HOME/.atom/local-packages/$package
  cd $HOME/.atom/local-packages/$package
  apm install
}

which atom > /dev/null
if test $? -eq 0 ; then
  ORIGINDIR=$(pwd)

  apm install --packages-file $HOME/.atom/atom-packages

  cd $HOME/.atom
  npm install
  mkdir -p $HOME/.atom/local-packages

  local_install silver-bullet
  local_install vim-cmdline-mode
  cd $ORIGINDIR
else
  echo "Error: atom is not installed!"
fi
