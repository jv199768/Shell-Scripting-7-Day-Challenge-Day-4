#!/bin/bash
#
## Prompt the user for a directory name
echo "Please enter a directory name:"
read directory_name

if [ -d "$directory_name"]; then
        echo "Directory already exists"
else
        mkdir $directory_name

     if [$? -eq 0]; then
             echo "Directory created successfully"
     else
             echo "Error creating directory"
     fi
fi
~    
