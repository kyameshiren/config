#!/bin/bash

packages=("dconf-cli" "uuid-runtime")

echo "INFO: checking dependencies"
# Make sure we have the packages for install
for package in "${packages[@]}"; do
        if ! dpkg -s "$package" &> /dev/null; then
                echo "INFO: installing $package"
                sudo apt install -y "$package"
        else 
                echo "ERROR: $package already installed"
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

export TERMINAL="$(ps -o comm= -p $(ps -o ppid= -p $$))"
export GOGH_APPLY_SCRIPT=themes/apply-colors.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEMES_DIR="${SCRIPT_DIR}/themes"

# Make dir for holding themes
if [[ ! -d "$THEMES_DIR" ]]; then
        mkdir -p "$THEMES_DIR"
fi

# Grab install script
if [[ ! -f "$THEMES_DIR/apply-colors.sh" ]]; then
        printf "INFO: grabbing install script\n"
        wget -P "$THEMES_DIR" "https://github.com/Gogh-Co/Gogh/raw/master/apply-colors.sh"
fi

# Install all themes in list
printf "INFO: grabbing themes...\n"
for theme in "${themes[@]}"; do
        if [[ ! -f "$THEMES_DIR/${theme}.sh" ]]; then
                echo "INFO: grabbing $theme"
                wget -P "$THEMES_DIR" "https://github.com/Gogh-Co/Gogh/raw/master/installs/${theme}.sh"
                chmod +x "$THEMES_DIR/${theme}.sh"
        fi
        bash "$THEMES_DIR/${theme}.sh"
done
