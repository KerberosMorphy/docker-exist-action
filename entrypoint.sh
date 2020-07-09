#!/bin/sh -l

echo "Login to docker registry $REGISTRY with user $USERNAME"
echo docker login $REGISTRY --username $USERNAME --password $PASSWORD
echo "::set-output name=image_exist::$(docker manifest inspect $IMAGE > /dev/null && echo 0 || echo 1)"
