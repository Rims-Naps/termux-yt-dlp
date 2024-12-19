#!/bin/bash

# Setup storage access
echo "Setting up Termux storage access..."
termux-setup-storage
echo "Waiting for you to accept the storage permission request..."
sleep 3  # Add a 3-second delay for the user to press 'Allow'

# Clean Install
echo "Cleaning old installation..."
rm -f "/data/data/com.termux/files/home/bin/termux-url-opener"
mkdir -p "/data/data/com.termux/files/home/bin"

# Update and install dependencies
echo "Updating and installing dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y wget python ffmpeg libexpat openssl
pip install -U "yt-dlp[default]"

# Download the updated termux-url-opener script
echo "Downloading termux-url-opener script..."
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/bin/termux-url-opener" "https://raw.githubusercontent.com/Rims-Naps/termux-yt-dlp/master/termux-url-opener"
chmod +x "/data/data/com.termux/files/home/bin/termux-url-opener"

# Final confirmation
echo "Installation complete! You can now share URLs with Termux for automated downloads."
