#!/bin/bash

# Take a screenshot and save it as 'screenshot.png'
gnome-screenshot -a -f screenshot.png

# Perform OCR on the screenshot using Tesseract and save the output to 'output.txt'
tesseract screenshot.png output -l eng

# Extract the text and save it to a variable
extracted_text=$(cat output.txt | sed 's/.*: //')

# Save the extracted text to the clipboard
echo "$extracted_text" | xclip -selection c

# Display a message indicating that the text has been saved to the clipboard
echo "Extracted text saved to clipboard"

