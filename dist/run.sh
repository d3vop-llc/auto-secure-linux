#!/bin/bash

# Ensure the script is executed from the directory it is located in
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Run the application with the configuration file
./auto-secure-linux config.toml