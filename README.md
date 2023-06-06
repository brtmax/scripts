# scripts

pix2char.sh is supposed to do OCR with handwritten text as well, but using tesseract this is not possible. Would be doable using things such as GoogleCloudVision API,
but this would be costly. I will try to train my own model once I have more time. 

save_install.sh
I am sure there is a better solution for this somewhere, but here we are. 
Run like this ./save_install.sh "package_name" 

Prompts if you want to save this package in a list to keep track of the actual important packages, without some of the clutter that you might have to install. 

Possible improvements
Creation of packages.txt file if it does not exist
installation script which install all packages from this list
