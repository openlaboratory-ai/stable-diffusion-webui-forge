#!/bin/bash

# Run the Python script with the specified arguments
python3 "$APP_DIRECTORY/launch.py" --api --port "$SD_WEBUI_FORGE_PORT" --subpath /sd-web-ui-forge --skip-torch-cuda-test --no-download-sd-model
