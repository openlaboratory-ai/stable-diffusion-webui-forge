# PREVIEW
# stable-diffusion-webui-forge

Simple and portable installation configuration for illyasevel/stable-diffusion-webui-forge.

## Important Notes

- Must download a model in order to start

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
  -e app=openlaboratory/forge \
  --gpus all \
  openlaboratory/community
```





