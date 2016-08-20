#!/bin/bash

HOME=${HOME}

dotfiles=(".zshrc" ".tmux.conf" ".vimrc" ".gitconfig" ".screenrc")
for dotfile in "${dotfiles[@]}"
do
	rm -f ${HOME}/${dotfile}
	echo "Delete symlink ${HOME}/${dotfile}"
done

rm -f ${HOME}/tmux.sh
echo "Delete symlink ${HOME}/tmux.sh"
rm -f ${HOME}/.zsh
echo "Delete symlink ${HOME}/.zsh"
rm -rf ${HOME}/.tmux
echo "Delete dirs ${HOME}/.tmux"
rm -rf ${HOME}/.vim
echo "Delete dirs ${HOME}/.vim"
rm -f ${HOME}/.ctags
echo "Detete dirs ${HOME}/.ctags"
