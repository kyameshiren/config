#!/bin/bash

userDirsConf="$HOME/.config/user-dirs.dirs"

old=(
        "$HOME/Documents"
        "$HOME/Pictures"
        "$HOME/Music"
        "$HOME/Videos"
        "$HOME/Templates"
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
        "$HOME/apps"
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
        cp "$userDirsConf" "$HOME/bak/$(basename $userDirsConf).bak"

        sed -i 's|^XDG_DESKTOP_DIR=.*|XDG_DESKTOP_DIR="$HOME/.desktop"|' "$userDirsConf"
        sed -i 's|^XDG_DOWNLOAD_DIR=.*|XDG_DOWNLOAD_DIR="$HOME/.downloads"|' "$userDirsConf"
        sed -i 's|^XDG_DOCUMENTS_DIR=.*|XDG_DOCUMENTS_DIR="$HOME/files"|' "$userDirsConf"
        sed -i 's|^XDG_MUSIC_DIR=.*|XDG_MUSIC_DIR="$HOME/music"|' "$userDirsConf"
        sed -i 's|^XDG_PICTURES_DIR=.*|XDG_PICTURES_DIR="$HOME/pics"|' "$userDirsConf"
        sed -i 's|^XDG_VIDEOS_DIR=.*|XDG_VIDEOS_DIR="$HOME/vids"|' "$userDirsConf"
        sed -i 's|^XDG_TEMPLATES=.*|XDG_TEMPLATES_DIR="$HOME/"|' "$userDirsConf"
        sed -i 's|^XDG_PUBLICSHARE_DIR=.*|XDG_PUBLICSHARE_DIR="$HOME/"|' "$userDirsConf"
fi

source "$HOME/.config/user-dirs.dirs"


bookmarks="$HOME/.config/gtk-3.0/bookmarks"

# Set GTK bookmarks
if [[ -f "$bookmarks" ]]; then

        cp "$bookmarks" "$HOME/bak/$(basename $bookmarks).bak"

        sed -i "s|file:///home/$USER/Documents|file:///home/$USER/files Files|" "$bookmarks"
        sed -i "s|file:///home/$USER/Music|file:///home/$USER/music Music|" "$bookmarks"
        sed -i "s|file:///home/$USER/Pictures|file:///home/$USER/pics Pictures|" "$bookmarks"
        sed -i "s|file:///home/$USER/Videos|file:///home/$USER/vids Videos|" "$bookmarks"
        sed -i "s|file:///home/$USER/Downloads|file:///home/$USER/.downloads Downloads|" "$bookmarks"

fi
        

