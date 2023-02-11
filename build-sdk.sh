#!/bin/bash

docker build -t $1-sdk -f targets/$1/sdk-docker/Dockerfile targets/$1/sdk-docker && docker run -it --rm -v $(pwd)/targets/$1/sdks:/sdks $1-sdk