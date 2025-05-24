#!/bin/bash

printf "Removing folders...\n"
./cfg/folders.sh
printf "Installing packages...\n"
./cfg/pack.sh
printf "Installing plugins...\n"
./cfg/plugins.sh
printf "Installing config files...\n"
./cfg/install.sh
printf "Backing up config files...\n"
./cfg/bak.sh
printf "Installing color themes...\n"
./cfg/colors.sh
printf "Applying git Settings\n"
./cfg/git.sh
printf "Done!\n"
