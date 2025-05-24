#!/bin/bash

printf "Updating system...\n"
./cfg/apt.sh
printf "Removing folders...\n"
./cfg/folders.sh
printf "\nInstalling packages...\n"
./cfg/pack.sh
printf "\nInstalling plugins...\n"
./cfg/plugins.sh
printf "\nInstalling config files...\n"
./cfg/install.sh
printf "\nBacking up config files...\n"
./cfg/bak.sh
printf "\nInstalling color themes...\n"
./cfg/colors.sh
printf "\nApplying git settings\n"
./cfg/git.sh
printf "\nDone!\n"
