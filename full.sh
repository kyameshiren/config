#!/bin/bash

printf "Removing folders...\n"
./cfg/folders.sh
echo "Installing packages...\n"
./cfg/pack.sh
echo "Installing plugins...\n"
./cfg/plugins.sh
echo "Installing config files...\n"
./cfg/install.sh
echo "Backing up config files...\n"
./cfg/bak.sh
echo "Installing color themes...\n"
./cfg/colors.sh
echo "Applying git Settings\n"
./cfg/git.sh
echo "Done!\n"
