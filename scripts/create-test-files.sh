#!/usr/bin/env bash

# This script creates test files for the project.
# Usage: ./create-test-files.sh

# Get script location
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
TEST_FILE_DIR="${SCRIPT_DIR}/../test_files"

# Create test files directory if it doesn't exist
mkdir -p "$TEST_FILE_DIR"

# Use dd to create a 500kB,900kB,1MB,2MB file with random data
dd if=/dev/urandom of="$TEST_FILE_DIR/400kB.bin" bs=400k count=1
dd if=/dev/urandom of="$TEST_FILE_DIR/500kB.bin" bs=500k count=1
dd if=/dev/urandom of="$TEST_FILE_DIR/900kB.bin" bs=900k count=1
dd if=/dev/urandom of="$TEST_FILE_DIR/1MB.bin" bs=1M count=1
dd if=/dev/urandom of="$TEST_FILE_DIR/2MB.bin" bs=2M count=1
