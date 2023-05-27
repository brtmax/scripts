#!/bin/bash

# Path to file to save the package names
SAVE_DIR="/home/max/dotfiles/packages.txt"

# Change to dotfiles directory
cd "$SAVE_DIR"

# Check if package name already exists in the file
if grep -Fxq "$1" "$SAVE_DIR"; then
  echo "Package name already exists in $SAVE_DIR. Skipping..."
else
  # Check if package name is a valid installation candidate
  if sudo apt-cache show "$1" >/dev/null 2>&1; then
    echo "$1" >> "$SAVE_DIR"
    echo >> "$SAVE_DIR"  # Add an empty line

    # Add, commit, and push changes to the repository
    git add .
    git commit -m "Saved package: $1"
    git push

    # Install the package
    sudo apt install "$1"
  else
    echo "Package name '$1' is not a valid installation candidate."
  fi
fi

# Navigate back to the directory where the script was called from
cd -

