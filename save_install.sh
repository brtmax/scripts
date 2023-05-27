#!/bin/bash

# Path to file to save the package names
SAVE_FILE_PATH="/home/max/dotfiles/packages.txt"

# Check if SAVE_FILE_PATH is a valid file
if [ ! -f "$SAVE_FILE_PATH" ]; then
  echo "Error: Invalid save file path '$SAVE_FILE_PATH'. Aborting."
  exit 1
fi

# Check if package name is a valid installation candidate
if ! apt-cache show "$1" >/dev/null 2>&1; then
  echo "Package name '$1' is not a valid installation candidate."
  exit 1
fi

# Change to save file directory
cd "$(dirname "$SAVE_FILE_PATH")"

# Check if package name exists in the file
if grep -Fxq "$1" "$SAVE_FILE_PATH"; then
  echo "Package name already exists in $SAVE_FILE_PATH. Skipping..."
else
  echo "$1" >> "$SAVE_FILE_PATH"
  echo >> "$SAVE_FILE_PATH"  # Add an empty line

  # Add, commit, and push changes to the repository
  git add .
  git commit -m "Saved package: $1"
  git push
fi

# Install the package
sudo apt install "$1"

# Navigate back to the directory where the script was called from
cd -
