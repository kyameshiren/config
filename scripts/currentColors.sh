#!/bin/bash

# Function to print colored text
print_colored_text() {
    local color_code=$1
    local text=$2
    echo -e "\e[${color_code}m${text}\e[0m"
}

# Example usage
print_colored_text "31" "Red Text"
print_colored_text "32" "Green Text"
print_colored_text "33" "Yellow Text"
print_colored_text "34" "Blue Text"
print_colored_text "35" "Magenta Text"
print_colored_text "36" "Cyan Text"
