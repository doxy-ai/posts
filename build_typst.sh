#!/bin/bash

# Loop through all .typst files in the current directory
for file in *.typ; do
  # Check if the file actually exists (in case there are no .typ files)
  if [ -f "$file" ]; then
    echo "Processing $file..."
    # Run the typst command on the file
    typst compile --features html --format html "$file"
  else
    echo "No .typst files found."
  fi
done