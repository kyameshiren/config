#!/bin/bash

packages=("vim" "curl" "tmux" "btop" "tealdeer" "python3" "timeshift")

for package in "${packages[@]}"; do
        if ! dpkg -s "$package" &> /dev/null; then
                echo "Installing $package"
                sudo apt install -y "$package"
        else
                echo "$package already installed!"
        fi
done

tldr --update
sudo timeshift --create --comments 'initial install'
