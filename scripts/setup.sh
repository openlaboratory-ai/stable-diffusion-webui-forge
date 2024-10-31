#!/bin/bash

# Clone or update repo
git clone https://github.com/lllyasviel/stable-diffusion-webui-forge "$APP_DIRECTORY"
cd "$APP_DIRECTORY"

echo "Pulling changes from commit..."
echo $APP_VERSION
git checkout $APP_VERSION

# Create and activate venv
python3 -m venv --system-site-package "$APP_DIRECTORY/$VENV_NAME"
source "$APP_DIRECTORY/$VENV_NAME/bin/activate"

# Install dependencies
pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
pip3 install -r "$APP_DIRECTORY/requirements_versions.txt"

