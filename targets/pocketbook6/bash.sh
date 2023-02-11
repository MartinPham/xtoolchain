#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/pocketbook6/mnt/ext1/system:/app/system -v $(pwd)/targets/pocketbook6/mnt:/mnt --entrypoint /bin/bash pocketbook6