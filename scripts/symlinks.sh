#!/bin/sh

red=31
green=32
yellow=33
blue=34
magenta=35
cyan=36
white=36

function cecho {
    local color=$1
    shift
    echo "\033[${color}m$@\033[m"
}

make_link() {
  local origin=$1
  local target=$2
  if [ ! -e $origin ]; then
    cecho $red "Warning: $origin does't exist."
  elif [ -L $target ]; then
    echo "Notice: $target is symbolic link file."
    echo "Symlink(Overwrite): $target -> $origin"
    rm -f $target
    ln -s $origin $target
  elif [ -e $target ]; then
    cecho $red "Warning: $target already exitsts."
  else
    echo "Symlink: $target -> $origin"
    ln -s $origin $target
  fi
}

link_dotfile() {
  local origin=${HOME}/dotfiles/_sources/_$1
  local target=${HOME}/.$1
  make_link $origin $target
}

files_to_copy=$(find ~/dotfiles/_sources -name "_*" -type f -exec basename {} \; | sed 's/^_//')

for i in ${files_to_copy[@]}; do
  link_dotfile $i
done

make_link ${HOME}/dotfiles/vimfiles ${HOME}/.vim
make_link ${HOME}/dotfiles/vim_backup ${HOME}/.vim_backup
make_link ${HOME}/dotfiles/evilfiles ${HOME}/.emacs.d
make_link ${HOME}/dotfiles/extapps/prezto ${HOME}/.zprezto
make_link ${HOME}/dotfiles/extapps/fzf ${HOME}/.fzf
make_link ${HOME}/dotfiles/extapps/z ${HOME}/.z_jump
