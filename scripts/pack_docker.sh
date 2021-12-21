#!/bin/bash
export DOCKER_BUILDKIT=1
cd "$(dirname "$0")/.."
mkdir -p ./dist

set -xe
sudo docker build -t skylark .
# sudo docker save skylark | pv > ./dist/skylark.tar
# du -sh ./dist/skylark.tar

RANDOM_TAG=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
sudo docker tag skylark ghcr.io/parasj/skylark-docker:$RANDOM_TAG
sudo docker push ghcr.io/parasj/skylark-docker:$RANDOM_TAG
echo "Code stored in ghcr.io/parasj/skylark-docker:$RANDOM_TAG"
export SKYLARK_DOCKER_IMAGE="ghcr.io/parasj/skylark-docker:$RANDOM_TAG"