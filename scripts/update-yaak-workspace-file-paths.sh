#!/usr/bin/env bash

# This script updates the paths in the yaak workspace file to point to the current location of the yaak repository.
# Usage: ./update-yaak-workspace-file-paths.sh

# Get script location
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
YAAK_WORKSPACE_DIR="${SCRIPT_DIR}/../yaak-workspace"
TEST_FILE_DIR="$(readlink -f "${SCRIPT_DIR}/../test_files")"


# Check if yaak-workspace directory exists
if [ ! -d "$YAAK_WORKSPACE_DIR" ]; then
  echo "Error: yaak-workspace directory does not exist."
  exit 1
fi

# Search each file in the yaak-workspace directory for the string "./yaak-file-upload-bug-repro/test_files/" and replace it with the absolute path
for file in "$YAAK_WORKSPACE_DIR"/*; do
  if [ -f "$file" ]; then
    sed -i "s|./yaak-file-upload-bug-repro/test_files/|$TEST_FILE_DIR/|g" "$file"
    echo "Updated paths in $file"
  fi
done

echo "All paths updated."
