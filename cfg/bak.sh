#!/bin/bash

backup="$HOME/bak"

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit")

if [[ ! -d ~/bak ]]; then
        mkdir ~/bak
fi

for i in "${configs[@]}"; do
        last="$backup/${i}.last"
        current="$HOME/$i"

        if [[ ! -f "$current" ]]; then
                echo "ERROR: no $current to backup"
                continue
        fi

        if [[ ! -f "$last" ]] || ! cmp -s "$current" "$last"; then
                timestamp="$(date +%F_%H-%M)"
                cp "$current" "${backup}/${i}_$timestamp"
                cp "$current" "$last"
                echo "INFO: backup $current to ${backup}/${i}_$timestamp"
        else
                echo "ERROR: no changes to $current since last backup"
        fi
done

