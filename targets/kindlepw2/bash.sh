#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/kindle5/mnt:/mnt --entrypoint /bin/bash kindle5