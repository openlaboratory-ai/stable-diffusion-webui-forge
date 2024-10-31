#!/bin/bash

# Download model
cd $APP_DIRECTORY/models/Stable-diffusion

# Need "--content-disposition" for it to save as the correct filename
wget --content-disposition $INITIAL_MODEL_DL_URL