#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CFG_DIR="${SCRIPT_DIR}/cfg"

printf "\nInstalling config files...\n"
"${CFG_DIR}/install.sh"
printf "\nBacking up config files...\n"
"${CFG_DIR}/bak.sh"
printf "\n__CURRENT COLORS__\n"
"${CFG_DIR}/dircolors.sh"
printf "^^CURRENT COLORS^^\n"

printf "\nDone!\n"
