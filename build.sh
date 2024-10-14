#!/bin/bash

vs_version=1.20.0-pre.6

# Build for ARM64
docker build arm64 --platform=linux/arm64 -t pstrt/vintagestory:$vs_version-arm64
docker build arm64 --platform=linux/arm64 -t pstrt/vintagestory:latest-arm64

# Build for AMD64
#docker build amd64 -t pstrt/vintagestory:$vs_version-amd64
#docker build amd64 -t pstrt/vintagestory:latest-amd64

# Push images
#docker push howwof/vintagestory:$vs_version-arm64
#docker push howwof/vintagestory:latest-arm64

#docker push howwof/vintagestory:$vs_version-amd64
#docker push howwof/vintagestory:latest-amd64
