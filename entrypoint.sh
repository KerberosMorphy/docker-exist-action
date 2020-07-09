#!/bin/sh -l

echo "Login to docker registry $REGISTRY"
echo $PASSWORD | docker login $REGISTRY --username $USERNAME --password-stdin
echo "::set-output name=image_exist::$(docker manifest inspect $IMAGE > /dev/null && echo 0 || echo 1)"
