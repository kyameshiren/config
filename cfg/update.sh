#!/bin/bash


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR"/bak.sh

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit") 

for i in "${configs[@]}"; do
        cp "$HOME/$i" "${SCRIPT_DIR}/$i" 
        echo "Moved $i to current to directory"
done

