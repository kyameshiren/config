#!/bin/bash

FOLDERS=(
    "$HOME/Documents"
    "$HOME/Downloads"
    "$HOME/Music"
    "$HOME/Pictures"
    "$HOME/Templates"
    "$HOME/Videos"
    "$HOME/Public"
)



for FOLDER in "${FOLDERS[@]}"; do
    echo " - $FOLDER"
done

read -p  "Delete the following folders? (y/n)" confirmation

if [[ "$confirmation" == "y" ]]; then
    for folder in "${FOLDERS[@]}"; do
        if [ -d "$folder" ]; then
            rm -rf "$folder"
            echo "Deleted $folder"
        else
            echo "$folder not found: Skipped"
        fi
    done
    echo "Done!"
fi
