# stable-diffusion-webui-forge
Simple and portable installation configuration for illyasevel/stable-diffusion-webui-forge.

## Important Notes

- Must download a model in order to start.

## Deploy On Cloud

Run this app within a cloud GPU labstation.

https://openlaboratory.ai/apps/stable-diffusion-webui-forge

## Run App Locally

### Dependencies

- Docker
- NVIDIA Container Toolkit

Ensure that both Docker and NVIDIA Container Toolkit are properly installed on your system before proceeding with the installation and running of the application.

### Docker

Pull and run the image from Docker Hub.

```bash
docker run -d \
  -p 8080:8080 \
  --gpus all \
  openlaboratory/stable-diffusion-webui-forge
```

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
