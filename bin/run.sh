#!/usr/bin/env bash
set -eo pipefail

docker stop $(docker ps -aq) || true
docker rm $(docker ps -aq) || true
docker-compose build go
docker-compose run --rm -d --service-ports go
