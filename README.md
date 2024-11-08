# stable-diffusion-webui-forge
Simple and portable installation configuration for illyasevel/stable-diffusion-webui-forge.

## Usage Notes

- In order to boot, this app must download a model before starting.  This is done as a setup step - the default model is Dreamshaper SD 1.5, and can be customized in the openlab.yaml configuration.


## Deploy On Cloud

Run this app within a cloud GPU labstation.

https://openlaboratory.ai/apps/stable-diffusion-webui-forge

## Run App Locally

### Dependencies

- [NVIDIA GPU](https://developer.nvidia.com/cuda-gpus)
- [NVIDIA CUDA 12.1.1+](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- [Docker](https://docs.docker.com/engine/install/)

Ensure that Docker is properly configured to utilize the NVIDIA Container Toolkit before proceeding with the installation and running of the application.

Run `docker run --rm --gpus all nvcr.io/nvidia/cuda:12.1.1-base-ubuntu22.04 nvidia-smi` to confirm - you should see output with the name of the connected GPU.

### Docker

Pull and run the image from Docker Hub.

```bash
docker run -d \
  -p 8080:8080 \
  --gpus all \
  openlaboratory/stable-diffusion-webui-forge
```

Open http://localhost:8080 in your browser to access the app.

### Docker Compose

Utilize the included `docker-compose.yml` configuration to easily re-use and customize the launch settings.

```bash
docker-compose up -d
```

### Local Container Build

Try customizing the `openlab.yml` config file and building the image locally.

```bash
# Build the container image
docker build . -t local/stable-diffusion-webui-forge

# Run the container
docker run -d \
  -p 8080:8080 \
  --gpus all \
  local/stable-diffusion-webui-forge
```

### Build Variables

Customize app installation and configuration by setting these env vars on the docker container.

| Variable | Description | Default |
| --- | --- | --- |
| INITIAL_MODEL_DL_URL | The URL to download the initial model from. | https://civitai.com/api/download/models/128713?type=Model&format=SafeTensor&size=pruned&fp=fp16 |


### Runtime Variables

Customize app installation and configuration by setting these env vars on the docker container.

| Variable | Description | Default |
| --- | --- | --- |
| APP_PORT | The port to run the web UI on. | 8080 |
