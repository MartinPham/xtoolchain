#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/kindle5/mnt:/mnt -v $(pwd)/targets/kindle5/env.sh:/env.sh --entrypoint /bin/bash kindle5