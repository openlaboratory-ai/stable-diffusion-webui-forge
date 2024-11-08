# stable-diffusion-webui-forge
Simple, portable, open-source installation configuration for [illyasevel/stable-diffusion-webui-forge](https://github.com/lllyasviel/stable-diffusion-webui-forge).

Uses [labkit](https://github.com/underhill-ai/labkit) to install and run the application within a GPU-enabled Docker container.

See the `openlab.yaml` file to view and customize the installation configuration.

## Run On Cloud

1-click launch this app on a cloud GPU workstion with [OpenLaboratory](https://openlaboratory.ai).

https://openlaboratory.ai/apps/stable-diffusion-webui-forge

## Screenshots

![Stable Diffusion WebUI Forge](https://localbarn.openlaboratory.ai/_next/image?url=%2Fapps%2Fstable-diffusion-webui%2Ft2i.png&w=3840&q=75)
![Stable Diffusion WebUI Forge 2](https://localbarn.openlaboratory.ai/_next/image?url=%2Fapps%2Fstable-diffusion-webui%2Fcontrolnet.png&w=3840&q=75)
![Stable Diffusion WebUI Forge 3](https://localbarn.openlaboratory.ai/_next/image?url=%2Fapps%2Fstable-diffusion-webui%2Finpainting.png&w=3840&q=75)
![Stable Diffusion WebUI Forge 4](https://localbarn.openlaboratory.ai/_next/image?url=%2Fapps%2Fstable-diffusion-webui%2Fextensions.png&w=3840&q=75)

## Run App Locally

### Dependencies

- [NVIDIA GPU](https://developer.nvidia.com/cuda-gpus)
- [NVIDIA CUDA 12.1.1+](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- [Docker](https://docs.docker.com/engine/install/)

Ensure that Docker is properly configured to utilize the NVIDIA Container Toolkit before proceeding with the installation and running of the application.

Run `docker run --rm --gpus all nvcr.io/nvidia/cuda:12.1.1-base-ubuntu22.04 nvidia-smi` to confirm - you should see output with the name of the connected GPU.

## Usage

- Access the web UI (port `8080` by default) to run a multitude of highly configurable text-to-image and image-to-image generation tasks.
- In order to boot, this app must download a model before starting.  This is done as a setup step - the default model is Dreamshaper SD 1.5, and can be customized in the openlab.yaml configuration.


### Docker (Recommended)

Pull and run the image from Docker Hub.

```bash
docker run -d \
  -p 8080:8080 \
  --gpus all \
  openlaboratory/stable-diffusion-webui-forge
```

Open http://localhost:8080 in your browser to access the app.

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

### Docker Compose

Utilize the included `docker-compose.yml` configuration to easily re-use and customize the launch settings.

```bash
docker-compose up -d
```

### Build Args

Set as a `build_arg` when building the Docker container to override the default settings in `openlab.yaml`.

| Variable | Description | Default |
| --- | --- | --- |
| INITIAL_MODEL_DL_URL | The URL to download the initial model from. | https://civitai.com/api/download/models/128713?type=Model&format=SafeTensor&size=pruned&fp=fp16 |


### Runtime Environment Variables

Set as an environment variable when running the Dccker container to override the default settings in `openlab.yaml`.

| Variable | Description | Default |
| --- | --- | --- |
| APP_PORT | The port to run the web UI on. | 8080 |
