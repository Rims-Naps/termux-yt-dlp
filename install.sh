#!/bin/bash
# Clean Install
rm -f "/data/data/com.termux/files/home/bin/termux-url-opener"
mkdir -p /data/data/com.termux/files/home/bin

# Installing dependencies
pkg update -y && pkg install wget -y && pkg install python -y && pkg install ffmpeg -y
yes | pip install yt-dlp

# Downloading the modified termux-url-opener script
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/bin/termux-url-opener" "https://your-repository-url/termux-url-opener"
chmod +x "/data/data/com.termux/files/home/bin/termux-url-opener"

# Setup storage access
termux-setup-storage
