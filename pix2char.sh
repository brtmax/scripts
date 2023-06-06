#!/bin/bash

# Take a screenshot and save it in the /tmp directory
gnome-screenshot -a -f /tmp/pix2char.png

# Perform OCR on the screenshot using Tesseract and save the output to a variable
extracted_text=$(tesseract /tmp/screenshot.png - -l eng 2>/dev/null)

# Save the extracted text to the clipboard
echo "$extracted_text" | xclip -selection c

# Display a message indicating that the text has been saved to the clipboard
echo "Extracted text saved to clipboard"

