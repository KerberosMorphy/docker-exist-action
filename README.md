# Docker exist action

This action check if an docker image already exist.

## Limitation

This action use the experimental feature of Docker CLI `docker manifest inspect`. This feature doesn't work with docker.pkg.github.com registry at the moment.

## Inputs

### `registry`

**Required** Regisry where the image is stored. Default `"docker.io"`.

### `username`

**Required** Regisry username.

### `password`

**Required** Regisry password.

### `image`

**Required** Image name with tag. Example: `docker_account/my_image:tag`.

## Outputs

### `image_exist`

The value `1` if image exist, `0` if the image doesn't exist.

## Example usage

```yml
jobs:
  job1:
    name: My Job
    runs-on: ubuntu-latest
    steps:
      - name: Check if image exist
        id: is_image_exist
        uses: tm-bverret/docker-exist-action@v1.1.1
        with:
          registry: docker.io
          username: ${{ secrets.DOCKER_USERNAME }}
          password: ${{ secrets.DOCKER_PASSWORD }}
          image: ${{ secrets.DOCKER_USERNAME }}/my_image:tag
      - name: Publish Image if not exist
        if: ((!steps.is_image_exist.outputs.image_exist))
        # I recommend https://github.com/trilom/file-changes-action
        # if you also want to check if Dockerfile
        # have change since last push.
        uses: docker/build-push-action@v1.1.0
        with:
          name: ${{ secrets.DOCKER_USERNAME }}/my_image
          username: ${{env.DOCKER_USERNAME}}
          password: ${{env.DOCKER_PASSWORD}}
          registry: docker.io
```
