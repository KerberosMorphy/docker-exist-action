#!/bin/sh -l

echo "Enabling experimental feature"
mkdir -p ~/.docker && echo '{"experimental": "enabled"}' > ~/.docker/config.json
echo "Login to docker registry $REGISTRY with user $USERNAME"
echo "$PASSWORD" | docker login $REGISTRY --username $USERNAME --password-stdin
echo "::set-output name=image_exist::$(docker manifest inspect $IMAGE > /dev/null && echo 0 || echo 1)"
