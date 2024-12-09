#!/usr/bin/env bash
set -euo pipefail

BLUE='\e[34m'
GREEN='\e[32m'
RED='\e[31m'
NC='\e[0m'

YTDLP_CONFIG_FOLDER="${HOME}/.config/yt-dlp/"
TERMUXURLOPENER_CONFIG_FOLDER="${HOME}/bin/"

echo -e "${BLUE}Termux YouTube Downloader Installation${NC}"
echo -e "\n${BLUE}Requirements:${NC}"
echo -e "  1. Allow storage access to Termux"
echo -e "  2. Working internet connection"
echo -e "  3. Sufficient storage space\n"

read -p "Press Enter when ready to continue..."

# Function to check command status
check_status() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ $1 completed successfully${NC}"
    else
        echo -e "${RED}✗ $1 failed${NC}"
        exit 1
    fi
}

# Basic setup
echo -e "\n${BLUE}Setting up environment...${NC}"
termux-setup-storage
sleep 2
check_status "Storage setup"

echo -e "\n${BLUE}Updating package repositories...${NC}"
pkg update -y
check_status "Package update"

echo -e "\n${BLUE}Installing required packages...${NC}"
pkg install -y python ffmpeg
check_status "Package installation"

echo -e "\n${BLUE}Installing/Updating pip packages...${NC}"
pip install -U wheel
pip install -U yt-dlp
check_status "Pip packages installation"

echo -e "\n${BLUE}Creating configuration directories...${NC}"
mkdir -p "$YTDLP_CONFIG_FOLDER" "$TERMUXURLOPENER_CONFIG_FOLDER"
check_status "Directory creation"

echo -e "\n${BLUE}Copying configuration files...${NC}"
cp -r yt-dlp ~/.config/
cp termux-url-opener "${TERMUXURLOPENER_CONFIG_FOLDER}/"
chmod +x "${TERMUXURLOPENER_CONFIG_FOLDER}/termux-url-opener"
check_status "Configuration files setup"

echo -e "\n${GREEN}Installation completed successfully!${NC}"
echo -e "\nYou can now share videos to Termux to download them."
echo -e "Downloads will be organized in your storage based on content type."