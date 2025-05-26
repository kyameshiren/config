#!/bin/bash

backup="$HOME/bak"

configs=(".bashrc" ".tmux.conf" ".vimrc" ".gdbinit")

if [[ ! -d ~/bak ]]; then
        mkdir ~/bak
fi

for i in "${configs[@]}"; do
        last="$backup/${i}".last
        current="$HOME/$i"
        if [[ -f "$last" ]]; then
                if cmp -s "$current" "$last"; then
                        echo "No changes to $i since last backup"
                        continue
                fi
        fi

        timestamp="$(date +%F_%T)"
        cp "$current" "${backup}/${i}_$timestamp"
        cp "$current" "$last"
        echo "Backup $current to ${backup}/${i}_$timestamp"

done

