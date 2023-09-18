#!/bin/bash

vs_version=1.18.11

# Build for ARM64
docker build arm64 --platform=linux/arm64 -t howwof/vintagestory:$vs_version-arm64
docker build arm64 --platform=linux/arm64 -t howwof/vintagestory:latest-arm64

# Build for AMD64
docker build amd64 -t howwof/vintagestory:$vs_version-amd64
docker build amd64 -t howwof/vintagestory:latest-amd64

# Push images
docker push howwof/vintagestory:$vs_version-arm64
docker push howwof/vintagestory:latest-arm64

docker push howwof/vintagestory:$vs_version-amd64
docker push howwof/vintagestory:latest-amd64
