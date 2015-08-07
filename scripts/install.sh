#!/bin/sh

make_link() {
  local origin=$1
  local target=$2
  if [ ! -e $origin ]; then
    echo "Warning: $origin does't exist."
  elif [ -L $target ]; then
    echo "Warning: $target is symbolic link file."
    echo "Symlink: $target -> $origin"
    rm -f $target
    ln -s $origin $target
  elif [ -e $target ]; then
    echo "Warning: $target already exitsts."
  else
    echo "Symlink: $target -> $origin"
    ln -s $origin $target
  fi
}

link_dotfile() {
  local origin=${HOME}/dotfiles/_$1
  local target=${HOME}/.$1
  make_link $origin $target
}

files_to_copy=(
  vimrc
  gvimrc
  gitconfig
  tigrc
  vimperatorrc
  zshrc
  zshrc.local
  zshenv
  zpreztorc
  tmux.conf
  tmux.conf.osx
)

for i in ${files_to_copy[@]}; do
  link_dotfile $i
done

make_link ${HOME}/dotfiles/vimfiles ${HOME}/.vim
make_link ${HOME}/dotfiles/vim_backup ${HOME}/.vim_backup
make_link ${HOME}/dotfiles/evilfiles ${HOME}/.emacs.d
make_link ${HOME}/dotfiles/prezto ${HOME}/.zprezto
make_link ${HOME}/dotfiles/fzf ${HOME}/.fzf
make_link ${HOME}/dotfiles/z ${HOME}/.z_jump
