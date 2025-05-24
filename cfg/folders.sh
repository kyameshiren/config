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
    rm $folder
done

mkdir ~/files
mkdir ~/pics
mkdir ~/music
mkdir ~/vids
