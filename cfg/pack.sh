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
