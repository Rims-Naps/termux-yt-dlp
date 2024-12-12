#!/bin/bash

# Clean Install
rm -f "/data/data/com.termux/files/home/bin/termux-url-opener"
mkdir -p /data/data/com.termux/files/home/bin

# Installing dependencies
pkg update -y && pkg upgrade -y
pkg install -y wget python ffmpeg libexpat openssl
pip install -U "yt-dlp[default]"

# Downloading the modified termux-url-opener script
wget --no-check-certificate --output-document="/data/data/com.termux/files/home/bin/termux-url-opener" "https://raw.githubusercontent.com/Rims-Naps/termux-yt-dlp/master/termux-url-opener"
chmod +x "/data/data/com.termux/files/home/bin/termux-url-opener"

# Setup storage access
termux-setup-storage

