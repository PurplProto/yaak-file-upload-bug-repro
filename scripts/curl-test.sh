#!/usr/bin/env bash

# This script tests uploading files using curl.
# Usage: ./curl-test.sh

# Get script location
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
# Get test files directory
TEST_FILE_DIR="${SCRIPT_DIR}/../test_files"

# Set local API URL
API_URL="http://localhost:3042/document/upload"

# Test uploading files individually

echo "Testing single file uploads with curl..."
# Loop through test files
for file in "$TEST_FILE_DIR"/*; do
    # Ensure the file exists
    if [[ -f "$file" ]]; then
        echo "Test $(basename $file)"
        # Use curl to upload the file
        if curl -X POST \
          --fail-with-body \
          -H "Content-Type: multipart/form-data" \
          -F "files=@$file" \
          "$API_URL"
        then
            echo -e "✅ File $file uploaded successfully.\n"
        else
            echo -e "❌ Failed to upload file $file.\n"
        fi
    else
        echo "File $file does not exist."
    fi
done

# Test uploading multiple files

echo "Testing multiple file uploads with curl..."

TEST_FILES=(
    "$TEST_FILE_DIR/500kB.bin"
    "$TEST_FILE_DIR/900kB.bin"
    "$TEST_FILE_DIR/1MB.bin"
    "$TEST_FILE_DIR/2MB.bin"
)

# Ensure all test files exist
for file in "${TEST_FILES[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "File $file does not exist."
        exit 1
    fi
done
# Use curl to upload multiple files
if curl -X POST \
  --fail-with-body \
  -H "Content-Type: multipart/form-data" \
  -F "files=@${TEST_FILES[0]}" \
  -F "files=@${TEST_FILES[1]}" \
  -F "files=@${TEST_FILES[2]}" \
  -F "files=@${TEST_FILES[3]}" \
  "$API_URL"
then
    echo -e "✅ Multiple files uploaded successfully.\n"
else
    echo -e "❌ Failed to upload multiple files.\n"
fi
