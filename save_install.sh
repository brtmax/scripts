#!/bin/bash

# Path to file to save the package names
SAVE_DIR="/home/max/dotfiles/packages.txt"

# Prompt user to save package name
read -p "Do you want to save the package name? (y/n): " response
if [[ $response =~ ^[Yy]$ ]]; then
  read -p "Enter the file name: " filename
  echo $1 >> "$SAVE_DIR/$filename"
  echo >> "$SAVE_DIR/$filename"  # Add an empty line

  # Change to dotfiles directory
  cd /home/max/dotfiles

  # Add, commit, and push changes to the repository
  git add .
  git commit -m "Saved $1"
  git push
fi

# Install the package
sudo apt install $1

