#!/bin/bash
echo "Pushing docker image ${DOCKER_IMAGE_NAME}:${VERSION} to DockerHub."
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push ${DOCKER_USERNAME}/${DOCKER_IMAGE_NAME}:latest

