#!/bin/bash

# Install dependencies
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
pip3 install -r "$APP_DIRECTORY/requirements_versions.txt"

