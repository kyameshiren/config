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

for folder in ${folders[@]}; do
        if [[ -f $folder ]]; then
                rm $folder
        fi
done

mkdir $HOME/files
mkdir $HOME/pics
mkdir $HOME/music
mkdir $HOME/vids
