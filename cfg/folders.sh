#!/bin/bash

folders=(
    "$HOME/Documents"
    "$HOME/Downloads"
    "$HOME/Music"
    "$HOME/Pictures"
    "$HOME/Templates"
    "$HOME/Videos"
    "$HOME/Public"
)

for folder in "${folders[@]}"; do
    echo " - $folder"
done

read -p  "Delete the following folders? (y/n)" confirmation

if [[ "$confirmation" == "y" ]]; then
    for folder in "${folders[@]}"; do
        if [ -d "$folder" ]; then
            rm -rf "$folder"
            echo "Deleted $folder"
        else
            echo "$folder not found: Skipped"
        fi
    done
    echo "Done!"
fi
