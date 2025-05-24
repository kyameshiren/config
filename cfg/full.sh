#!/bin/bash

echo "Removing folders..."
./folders.sh
echo "Installing packages..."
./pack.sh
echo "Installing plugins..."
./plugins.sh
echo "Installing config files..."
./install.sh
echo "Backing up config files..."
./bak.sh
echo "Installing color themes..."
./colors.sh
echo "Applying git Settings"
./git.sh
echo "Done!"
