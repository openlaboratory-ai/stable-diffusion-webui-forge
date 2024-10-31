#!/bin/bash

# Activate the virtual environment
source "$APP_DIRECTORY/$VENV_NAME/bin/activate"

# Run the Python script with the specified arguments
python3 "$APP_DIRECTORY/launch.py" --api --port "$SD_WEBUI_FORGE_PORT" --subpath /sd-web-ui-forge --skip-torch-cuda-test --no-download-sd-model
