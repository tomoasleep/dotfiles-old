files_to_copy=(
  vimrc
  gvimrc
  tigrc
  vimperatorrc
  zshrc
  zshenv
  zpreztorc
  tmux.conf
)

for i in ${files_to_copy[@]}
do
  scorefile=${HOME}/dotfiles/_${i}
  dotfile=${HOME}/.${i}
  if [ -e $scorefile ]; then
    echo "Create symbolic link: $scorefile to $dotfile"
    ln -s $scorefile $dotfile
  fi
done

ln -s ${HOME}/dotfiles/vimfiles ${HOME}/.vim
ln -s ${HOME}/dotfiles/dotjs/js ${HOME}/.js
