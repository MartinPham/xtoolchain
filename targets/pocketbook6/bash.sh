#!/bin/bash

docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/pocketbook6/mnt/ext1/system:/app/system -v $(pwd)/targets/pocketbook6/mnt:/mnt -v $(pwd)/targets/pocketbook6/env.sh:/env.sh  --entrypoint /bin/bash pocketbook6