#!/bin/bash

packages=("dconf-cli" "uuid-runtime")

echo "Checking dependencies..."
# Make sure we have the packages for install
for package in "${packages[@]}"; do
        if ! dpkg -s "$package" &> /dev/null; then
                echo "Installing $package"
                sudo apt install -y "$package"
        else 
                echo "$package already installed!"
        fi
done

# Add default profile for fresh install
if [[ -z $(dconf list /org/gnome/terminal/) ]];then
        uuid=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
        gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$uuid/" visible-name 'InitializedProfile'
fi

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
        "monokai-pro"
        "monokai-pro-ocatagon"
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
export GOGH_APPLY_SCRIPT=themes/apply-colors.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEMES_DIR="${SCRIPT_DIR}/themes"

# Make dir for holding themes
if [[ ! -d "$THEMES_DIR" ]]; then
        mkdir -p "$THEMES_DIR"
fi

# Grab install script
if [[ ! -f "$THEMES_DIR/apply-colors.sh" ]]; then
        printf "Grabbing install script\n"
        wget -P "$THEMES_DIR" "https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh"
else
        printf "Skipping install script...\n"
fi

# Install all themes in list
printf "Grabbing themes...\n"
for theme in "${themes[@]}"; do
        if [[ ! -f "$THEMES_DIR/${theme}.sh" ]]; then
                echo "Grabbing $theme"
                wget -P "$THEMES_DIR" "https://github.com/Gogh-Co/Gogh/raw/master/installs/${theme}.sh"
                chmod +x "$THEMES_DIR/${theme}.sh"
        else
                echo "$theme already in folder"
        fi
done

# Install themes
for theme in "${themes[@]}"; do
        bash "$THEMES_DIR/${theme}.sh"
done
