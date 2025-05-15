#!/bin/bash

packages=("dconf-cli" "uuid-runtime")

echo "Checking dependencies..."
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

printf "\n"
# Grab install script
if [[ ! -f themes/apply-colors.sh ]]; then
        printf "Grabbing install script\n"
        wget https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh
        mv apply-colors.sh themes
else
        printf "Skipping install script...\n"
fi

# Make dir for holding themes
if [[ ! -d themes ]]; then
        mkdir themes
fi

printf "\n"
# Install all themes in list
printf "Installing themes...\n"
for theme in ${themes[@]}; do
        if [[ ! -f themes/${theme}.sh ]]; then
                echo "Installing $theme"
                wget https://github.com/Gogh-Co/Gogh/raw/master/installs/${theme}.sh
                chmod +x ./${theme}.sh
                ./${theme}.sh
                mv ${theme}.sh themes
        else
                echo "$theme already installed"
        fi
done
