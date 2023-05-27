gnome-screenshot -a -f /tmp/latex.png && source ~/repos/latex_ocr/venv/bin/activate && cd  ~/repos/latex_ocr/venv/lib/python3.8/site-packages/pix2tex && python3 -m pix2tex /tmp/latex.png > /tmp/latex.txt && deactivate
cat /tmp/latex.txt | sed 's/.*: //' | xclip -selection c
