#!/bin/bash

PACKAGES=(curl tmux btop)

function is_installed() {
    dpkg -l | grep -qw "$1"
}

function install_package() {
    echo "Installing $1..."
    sudo apt install -y "$1"
}

for package in "${PACKAGES[@]}"; do
    if is_installed "$package"; then
        echo "$package already installed!"
    else
        install_package "$package"
    fi
done
        
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim







