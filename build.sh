#!/bin/bash
set -e

IMAGE="anitodevops/app-image:latest"

#Build the docker image using Dockerfile in current dir
echo "Building Docker ${IMAGE}"
docker build -t "${IMAGE}" .

#Pushing the image to Dockerhub Registry
echo "Pushing Docker ${IMAGE} to Registry"
docker push ${IMAGE}

