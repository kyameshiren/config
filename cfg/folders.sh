#!/bin/bash

old=(
        "$HOME/Documents"
        "$HOME/Downloads"
        "$HOME/Music"
        "$HOME/Pictures"
        "$HOME/Templates"
        "$HOME/Videos"
        "$HOME/Public"
)

new=(
        "$HOME/files"
        "$HOME/pics"
        "$HOME/music"
        "$HOME/vids"
)


for dir in "${old[@]}"; do
        if [[ -d "$dir" ]]; then
                rmdir "$dir"
        else
                echo "$dir not found!"
        fi
done

for dir in "${new[@]}"; do
        if [[ ! -d "$dir" ]]; then
                mkdir -p "$dir"
        else
                echo "$dir already exists!"
        fi
done

