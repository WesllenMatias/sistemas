#!#!/usr/bin/env bash



sudo apt update -y && sudo apt upgrade -y && \
sudo apt install virtualbox -y && \
sudo apt install filezilla -y && \
sudo apt install htop -y && \
sudo apt install curl -y && \
sudo apt install bmon -y && \
sudo apt install telegram-desktop -y && \
sudo apt install lynx -y && \
sudo apt install dialog -y && \
sudo apt install jq -y && \
sudo apt install steam -y && \
sudo apt install tmux -y && \
sudo apt install screenfetch -y && \
sudo apt install atom -y && \
sudo apt install git -y && \
sudo apt install gimp -y && \
cd ~/Downloads/ && \
wget https://go.skype.com/skypeforlinux-64.deb && \
sudo dpkg -i skypeforlinux-64.deb && \
sudo apt install -f -y && \
sudo apt install gitkraken -y && \
sudo aopt install youtube-dl -y && \
sudo apt install kodi
