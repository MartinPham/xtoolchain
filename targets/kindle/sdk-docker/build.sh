#!/bin/bash

git clone https://github.com/koreader/koxtoolchain.git

cd koxtoolchain && ./gen-tc.sh kindle && tar -zcvf /sdks/kindle.tar.gz /home/sdk/x-tools