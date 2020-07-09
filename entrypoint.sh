#!/bin/sh -l

echo "Enabling experimental feature"
mkdir -p ~/.docker && echo '{"experimental": "enabled"}' > ~/.docker/config.json
echo "Login to docker registry $REGISTRY"
echo "$PASSWORD" | docker login --username $USERNAME --password-stdin $REGISTRY
echo "::set-output name=image_exist::$(docker manifest inspect $IMAGE > /dev/null && echo 1 || echo 0)"
