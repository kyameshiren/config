#!/bin/bash

PACKAGES=(git vim tmux timeshift btop)

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
        








