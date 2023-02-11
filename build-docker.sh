#!/bin/bash

docker build -t $1 -f targets/$1/docker/sdk-prebuilt.Dockerfile targets/$1