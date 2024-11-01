# stable-diffusion-webui-forge
Simple and portable installation configuration for illyasevel/stable-diffusion-webui-forge.

## Important Notes

- Must download a model in order to start.

## Deploy On Cloud

Run this app within a cloud GPU labstation.

https://openlaboratory.ai/apps/stable-diffusion-webui-forge

## Run App Locally
### Docker Compose (Recommended)

```bash
docker-compose up -d
```
Must have docker and nvidia-container-toolkit installed.

### Docker Run
```bash
docker run -d \
  --name openlaboratory \
  -p 8080:8080 \
  -e app=openlaboratory/stable-diffusion-webui-forge \
  --gpus all \
  openlaboratory/community
```

### Environment Variables

Customize app installation and configuration by setting these env vars on the docker container.

| Variable | Description | Default |
| --- | --- | --- |
| APP_DIRECTORY | The directory where the app should be installed. | /workspace/stable-diffusion-webui-forge |
| APP_PORT | The port to run the web UI on. | 8080 |
| APP_VERSION | The version of the app to run. Defaults to 'main'. | main |
| VENV_NAME | The name of the virtual environment to create and use. | venv |
| INITIAL_MODEL_DL_URL | The URL to download the initial model from. | https://civitai.com/api/download/models/128713?type=Model&format=SafeTensor&size=pruned&fp=fp16 |
