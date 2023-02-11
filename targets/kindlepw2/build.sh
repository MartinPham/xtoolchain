#!/bin/bash
docker run -it --rm -v $(pwd)/src:/app/src -v $(pwd)/targets/kindle5/mnt:/mnt kindle5 $1