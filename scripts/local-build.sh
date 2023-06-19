#!/usr/bin/env bash

recipe=${1:-./recipe.yml}

imageName=$(yq .name $recipe)
fedoraMajorVersion=$(yq .fedora-version $recipe)
baseImageUrl=$(yq .base-image $recipe)

podman build . --build-arg=FEDORA_MAJOR_VERSION=$fedoraMajorVersion --build-arg=BASE_IMAGE_URL=$baseImageUrl --build-arg=RECIPE=$recipe -t $imageName
