#!/bin/bash

user=$(whoami)
home=/home/${user}

configs=(".bashrc" ".tmux.conf" ".vimrc") 

for i in ${configs[@]}; do
        cp $home/$i ./$i 
done

