#!/bin/bash

user=$(whoami)
home=/home/${user}

configs=(".bashrc" ".tmux.conf" ".vimrc") 

for i in ${configs[@]}; do
        cp ./$i $home/$i
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
