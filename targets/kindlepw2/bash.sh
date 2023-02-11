#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/kindlepw2/mnt:/mnt -v $(pwd)/targets/kindlepw2/env.sh:/env.sh  --entrypoint /bin/bash kindlepw2