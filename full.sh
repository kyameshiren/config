#!/bin/bash

echo "Removing folders..."
./cfg/folders.sh
echo "Installing packages..."
./cfg/pack.sh
echo "Installing plugins..."
./cfg/plugins.sh
echo "Installing config files..."
./cfg/install.sh
echo "Backing up config files..."
./cfg/bak.sh
echo "Installing color themes..."
./cfg/colors.sh
echo "Applying git Settings"
./cfg/git.sh
echo "Done!"
