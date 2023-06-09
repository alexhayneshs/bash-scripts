#!/bin/bash

# Look through subdirectories in the components directory. 
# For each subdirectory, find the main component file (i.e. the first .tsx file it finds in the subdirectory)
# then create an index.ts file with a default export of the main file
# The > operator is used to redirect the output of the echo command into the index.ts file.

# Move to the components directory
cd components 

# Loop through all subdirectories
for dir in */; do
  # Get the name of the main component file
  main_file=$(find $dir -maxdepth 1 -type f -name '*.tsx' | head -n 1)
  main_file=${main_file##*/}
  main_file=${main_file%.*}

  # Create the index.ts file
  echo "export { default } from './$main_file';" > "$dir/index.ts"
done