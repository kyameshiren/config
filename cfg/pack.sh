#!/bin/bash

packages=("vim-gtk3" "curl" "tmux" "btop" "tealdeer" "python3" "timeshift")

for package in "${packages[@]}"; do
        if ! dpkg -s "$package" &> /dev/null; then
                echo "INFO: installing $package"
                sudo apt install -y "$package"
        else
                echo "INFO: $package already installed"
        fi
done

if ! dpkg -s "librewolf" &> /dev/null; then
        sudo apt update && sudo apt install extrepo -y
        sudo extrepo enable librewolf
        sudo apt update && sudo apt install librewolf -y
        echo "INFO: installing librewolf"
else
        echo "INFO: librewolf already installed"
fi
