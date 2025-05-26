#!/bin/bash


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/bak.sh"

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit") 

for i in "${configs[@]}"; do
        cp "${SCRIPT_DIR}/$i" "$HOME/$i"
        echo "Moved $i to home directory"
done

source ~/.bashrc
