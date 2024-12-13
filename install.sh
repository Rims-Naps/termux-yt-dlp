#!/bin/bash

# Set up termux-url-opener for yt-dlp

# Remove any existing termux-url-opener file
echo "Cleaning up old installation..."
rm -f "/data/data/com.termux/files/home/bin/termux-url-opener"

# Create the bin directory if it doesn't exist
echo "Creating bin directory..."
mkdir -p "/data/data/com.termux/files/home/bin"

# Update and install dependencies
echo "Updating packages and installing dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y wget python ffmpeg libexpat openssl

# Install yt-dlp via pip
echo "Installing yt-dlp..."
pip install -U "yt-dlp[default]"

# Download the termux-url-opener script
echo "Downloading the termux-url-opener script..."
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/bin/termux-url-opener" "https://raw.githubusercontent.com/Rims-Naps/termux-yt-dlp/master/termux-url-opener"

# Set executable permissions
echo "Setting permissions for the termux-url-opener script..."
chmod +x "/data/data/com.termux/files/home/bin/termux-url-opener"

# Set up storage access
echo "Requesting storage access..."
termux-setup-storage

echo "Installation completed successfully. You can now use yt-dlp with termux-url-opener."
