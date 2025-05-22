#!/bin/bash

user=$(whoami)
home=/home/${user}

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit") 

for i in ${configs[@]}; do
        cp ./$i $home/$i
done


