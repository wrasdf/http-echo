#!/usr/bin/env bash
set -eo pipefail

if [[ "$#" -ne 1 ]]; then
  echo "Usage: bin/build.sh <version>"
  exit 1
fi

version=$1

docker build --target release -t ikerry/http-echo:$version .
docker-compose run --rm trivy image --severity MEDIUM,HIGH,CRITICAL --exit-code 1 ikerry/http-echo:$version

docker push ikerry/http-echo:$version
docker tag ikerry/http-echo:$version ikerry/http-echo:latest
docker push ikerry/http-echo:latest
