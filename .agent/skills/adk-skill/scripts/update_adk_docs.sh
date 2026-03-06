#!/bin/bash

# Script to fetch the latest ADK documentation
# URL: https://raw.githubusercontent.com/google/adk-python/main/llms-full.txt
# Destination: resources/llms-full.txt

# Get the directory of this script, to make paths relative
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
RESOURCES_DIR="$SCRIPT_DIR/../resources"

# Ensure resources directory exists
mkdir -p "$RESOURCES_DIR"

# Download the documentation
curl -sS -o "$RESOURCES_DIR/llms-full.txt" https://raw.githubusercontent.com/google/adk-python/main/llms-full.txt

if [ $? -eq 0 ]; then
    echo "ADK documentation successfully updated at $RESOURCES_DIR/llms-full.txt"
else
    echo "Failed to update ADK documentation."
    exit 1
fi
