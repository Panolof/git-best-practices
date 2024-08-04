#!/bin/bash

# Define the directory
directory="."

# Function to print the tree structure
print_tree() {
  echo "Directory Structure:"
  find "$directory" -maxdepth 1 -not -path '*/\.*' -type d -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  find "$directory" -maxdepth 1 -not -path '*/\.*' -type f -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
  if [ -f "$directory/.gitignore" ]; then
    echo "|____ .gitignore"
  fi
  echo "---"
}

# Check if the directory exists
if [ -d "$directory" ]; then
  # Print the tree structure
  print_tree
  # Loop through each file in the directory, excluding hidden files except .gitignore
  for file in "$directory"/*; do
    # Check if it is a file and not the script itself
    if [ -f "$file" ] && [ "$file" != "./echo_helpers_content.sh" ]; then
      # Output the file name and start marker
      echo "Contents of $file:"
      echo "FILE START: $file"
      # Output the contents of the file
      cat "$file"
      # Print the end marker
      echo "FILE END: $file"
      # Print the line divider
      echo "---"
    fi
  done
  # Include .gitignore if it exists
  if [ -f "$directory/.gitignore" ]; then
    echo "Contents of $directory/.gitignore:"
    echo "FILE START: $directory/.gitignore"
    cat "$directory/.gitignore"
    echo "FILE END: $directory/.gitignore"
    echo "---"
  fi
else
  echo "Directory $directory does not exist."
fi
