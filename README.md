# About this image

This image can be used to run a dedicated server for [Vintage Story](https://www.vintagestory.at/)

## Run this image with docker compose

To run this image with docker compose you can start using the following file:

```yaml
version: '3.8'

services:
  vsserver:
    image: howwof/vintagestory:latest-(chose architecture arm64 or amd64)
    container_name: vsserver
    restart: unless-stopped
    volumes:
    # • your world will be in /appdata/vintagestory/vs by default (/gamedata/vs on the container)
    # • if you run multiple servers just change the left part
    # • you could also use docker volumes instead of host path
      - ./appdata/vintagestory:/gamedata
    ports:
      - 42420:42420
```

### Updating container

To update to the latest version call `docker compose pull` first, this will download the newest latest base image. Then execute `docker compose up -d`.

### Copy/Override files

If you use a host volume, you can just edit files there. First stop the container, then make your changes and start the container again.

## Architectures

This image supports AMD64 and ARM64 architectures
