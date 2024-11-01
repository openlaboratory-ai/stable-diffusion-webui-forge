#!/bin/bash

# Load the JSON configuration
CONFIG_FILE="config.json"

# Check if jq is installed for parsing JSON
if ! command -v jq &> /dev/null; then
  echo "jq is required but not installed. Please install jq and try again."
  exit 1
fi

# Parse JSON configuration and set environment variables with defaults if not already set
APP_ID=$(jq -r '.appId' "$CONFIG_FILE")
SOURCE=$(jq -r '.source' "$CONFIG_FILE")
STARTUP_SCRIPT=$(jq -r '.startupScript' "$CONFIG_FILE")
SETUP_SCRIPTS=$(jq -r '.setupScripts[]' "$CONFIG_FILE")

# Set environment variables from config with defaults if not already set
jq -c '.envVars[]' "$CONFIG_FILE" | while IFS= read -r env; do
  VAR_NAME=$(echo "$env" | jq -r '.envVar')
  DEFAULT_VALUE=$(echo "$env" | jq -r '.default')
  
  # Check if the variable is already set in the environment, if not, set it to the default
  if [ -z "${!VAR_NAME}" ]; then
    export "$VAR_NAME"="$DEFAULT_VALUE"
    echo "Setting $VAR_NAME to default value: $DEFAULT_VALUE"
  else
    echo "$VAR_NAME is already set to: ${!VAR_NAME}"
  fi
done

# Run each setup script
echo "Running setup scripts..."
for SCRIPT in $SETUP_SCRIPTS; do
  if [ -f "$SCRIPT" ]; then
    echo "Executing $SCRIPT"
    bash "$SCRIPT"
  else
    echo "Setup script $SCRIPT not found, skipping."
  fi
done

# Run the startup script
if [ -f "$STARTUP_SCRIPT" ]; then
  echo "Running startup script: $STARTUP_SCRIPT"
  bash "$STARTUP_SCRIPT"
else
  echo "Startup script $STARTUP_SCRIPT not found."
fi