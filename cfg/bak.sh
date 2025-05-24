#!/bin/bash

input=$HOME
backup=$HOME/bak

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit")

if [ ! -d ~/bak ]; then
        mkdir ~/bak
fi

for i in ${configs[@]}; do
        cp $input/$i ${backup}/${i}_$(date +%F_%T)
        echo "Backup $input/$i to ${backup}/${i}_$(date +%F_%T)"
done

