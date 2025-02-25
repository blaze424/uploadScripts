#!/bin/bash

# Set the remote name configured in rclone
REMOTE="mymega"

# Define directories for ZIP files and recovery images
ZIP_DIR="uploads/"
RECOVERY_DIR="uploads/"

# Upload ZIP files
echo "Uploading ZIP files from $ZIP_DIR..."
for zip_file in "$ZIP_DIR"/*/*.zip; do
    if [[ -f "$zip_file" ]]; then
        rclone copy "$zip_file" "$REMOTE:/crave"
        echo "$zip_file uploaded successfully!"
    else
        echo "No ZIP files found in $ZIP_DIR."
    fi
done

# Upload recovery images
echo "Uploading recovery images from $RECOVERY_DIR..."
for recovery_file in "$RECOVERY_DIR"/*/recovery.img; do
    if [[ -f "$recovery_file" ]]; then
        rclone copy "$recovery_file" "$REMOTE:/crave"
        echo "$recovery_file uploaded successfully!"
    else
        echo "No recovery images found in $RECOVERY_DIR."
    fi
done
