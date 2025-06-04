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
                echo "error: No $current to backup!"
                continue
        fi

        if [[ ! -f "$last" ]] || ! cmp -s "$current" "$last"; then
                timestamp="$(date +%F_%H-%M)"
                cp "$current" "${backup}/${i}_$timestamp"
                cp "$current" "$last"
                echo "Backup $current to ${backup}/${i}_$timestamp"
        else
                echo "error: No changes to $current since last backup!"
        fi
done

