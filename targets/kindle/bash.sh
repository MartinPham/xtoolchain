#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/kindle/mnt:/mnt -v $(pwd)/targets/kindle/env.sh:/env.sh --entrypoint /bin/bash kindle