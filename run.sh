#!/usr/bin/env bash

echo "Building docker image..."
docker build -t pre-commit:test .

echo -e "\n***Running hook as user 1000 (this will pass)***"
docker run --user 1000 -ti --rm pre-commit:test

echo -e "\n***Running hook as root user (this will fail)***"
docker run -ti --rm pre-commit:test
