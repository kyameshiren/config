#!/bin/bash

packages=("dconf-cli" "uuid-runtime")

# Make sure we have the packages for install
for package in ${packages[@]}; do
        if ! dpkg -s $package &> /dev/null; then
                echo "Installing $package"
                sudo apt install -y $package 
        else 
                echo "$package already installed!"
        fi
done


themes=(
        "3024-night"
        "afterglow"
        "arc-dark"
        "astrodark"
        "azu"
        "breath-silverfox"
        "flat"
        "frontend-galaxy"
        "github-dark"
        "gogh"
        "google-dark"
        "highway"
        "horizon-dark"
        "liquid-carbon"
        "misterioso"
        "nanosecond"
        "nighty"
        "obsidian"
        "selenized-black"
        "snazzy"
        "solarized-dark-higher-contrast"
        "srcery"
        "terminal-basic"
)

export TERMINAL=gnome-terminal
export GOGH_APPLY_SCRIPT=./apply_colors

# Grab install script
echo "Running GOGH-CO script..."
if [[ ! -f apply-colors.sh ]]; then
        echo "Grabbing install script"
        wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
else
        echo "Skipping install script"
fi

# Make dir for holding themes
if [[ ! -d themes ]]; then
        mkdir themes
fi

# Install all themes in list
for theme in ${themes[@]}; do
        mv ${theme}.sh themes
#        if [[ ! -f ${theme}.sh ]]; then
#                echo "Installing $theme"
#                wget https://github.com/Gogh-Co/Gogh/raw/master/installs/${theme}.sh
#                chmod +x ./${theme}.sh
#                ./${theme}.sh
#                mv ${theme}.sh themes
#        else
#                echo "$theme already installed"
#        fi
done
