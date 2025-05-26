#!/bin/bash

userDirsConf="$HOME/.config/user-dirs.dirs"

old=(
        "$HOME/Desktop"
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
        "$HOME/.desktop"
        "$HOME/.downloads"
        "$HOME/bak"
)

# Move folders to retain data
if [[ -d "$HOME/Desktop" ]]; then
        mv -n "$HOME/Desktop" "$HOME/.desktop"
fi

if [[ -d "$HOME/Downloads" ]]; then
        mv -n "$HOME/Downloads" "$HOME/.downloads"
fi

# Delete old folders
for dir in "${old[@]}"; do
        if [[ -d "$dir" ]]; then
                rmdir "$dir"
        else
                echo "$dir not found!"
        fi
done

# Make new folders
for dir in "${new[@]}"; do
        if [[ ! -d "$dir" ]]; then
                mkdir -p "$dir"
        else
                echo "$dir already exists!"
        fi
done

# Set XDG defaults
if [[ -f "$userDirsConf" ]]; then
        cp "$userDirsConf" "$HOME/bak/$(basename "$userDirsConf").bak"

        sed -i 's|^XDG_DESKTOP_DIR=.*|XDG_DESKTOP_DIR="$HOME/.desktop"|' "$userDirsConf"
        sed -i 's|^XDG_DOWNLOAD_DIR=.*|XDG_DOWNLOAD_DIR="$HOME/.downloads"|' "$userDirsConf"
        sed -i 's|^XDG_DOCUMENTS_DIR=.*|XDG_DOCUMENTS_DIR="$HOME/files"|' "$userDirsConf"
        sed -i 's|^XDG_MUSIC_DIR=.*|XDG_MUSIC_DIR="$HOME/music"|' "$userDirsConf"
        sed -i 's|^XDG_PICTURES_DIR=.*|XDG_PICTURES_DIR="$HOME/pics"|' "$userDirsConf"
        sed -i 's|^XDG_TEMPLATES=.*|XDG_TEMPLATES_DIR="$HOME/"|' "$userDirsConf"
        sed -i 's|^XDG_PUBLICSHARE_DIR=.*|XDG_PUBLICSHARE_DIR="$HOME/"|' "$userDirsConf"
fi


source "$HOME/.config/user-dirs.dirs"



