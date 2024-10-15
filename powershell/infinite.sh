#!/bin/bash

# Define the URL of the file to be downloaded
url="http://example.com/file.zip"

# Function to download the file
download_file() {
    wget -O /path/to/destination/file.zip "$url"
    if [ $? -ne 0 ]; then
        echo "Failed to download the file."
        exit 1
    else
        echo "Download successful."
    fi
}

# Infinite loop to continuously attempt the download
while true; do
    download_file
    sleep 10  # Delay before the next download attempt, adjust as needed
done
