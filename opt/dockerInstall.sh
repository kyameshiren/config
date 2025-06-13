#!/usr/bin/env bash

if [[ -z "$1" ]]; then
        echo "Usage: $0 <username>"
        exit 1
fi

TARGET_USER="$1"

# Remove conflicting packages
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do 
        sudo apt purge -y "$pkg"
done

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Add user to docker group
sudo groupadd -f docker
sudo usermod -aG docker "$TARGET_USER"


