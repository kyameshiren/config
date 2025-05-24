#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
home=$HOME

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit") 

for i in ${configs[@]}; do
        cp $home/$i ${SCRIPT_DIR}/$i 
done

