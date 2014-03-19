files=(
  vimrc
  gvimrc
  tigrc
  vimperatorrc
  zshrc
  zshenv
)

for i in $files
do
  scorefile=${HOME}/dotfiles/_${i}
  dotfile=${HOME}/.${i}
  if [ -e $scorefile ]; then
    echo "Create symbolic link: $scorefile to $dotfile"
    ln -s $scorefile $dotfile
  fi
done

ln -s ${HOME}/dotfiles/vimfiles ${HOME}/.vim
ln -s ${HOME}/dotfiles/dotjs ${HOME}/.js
