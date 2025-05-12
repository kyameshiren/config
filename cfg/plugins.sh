#!/bin/bash

if [ ! -d ~/.tmux/plugins/tpm ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        cat ./tpm >> ~/.tmux.conf
        tmux source ~/.tmux.conf
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        cat ./vimplug >> ~/.vimrc
        vim +PlugInstall +qall
