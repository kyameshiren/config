#!/bin/bash

user=$(whoami)
input=/home/${user}
backup=/home/${user}/bak

configs=(".bashrc" ".tmux.conf" ".vimrc") 

if [ ! -d ~/bak ]; then
        mkdir ~/bak
fi

for i in ${configs[@]}; do
        cp $input/$i ${backup}/${i}_$(date +%F_%T) 2> /dev/null
done

