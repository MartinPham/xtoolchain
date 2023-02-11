#!/bin/bash

git clone https://github.com/koreader/koxtoolchain.git

cd koxtoolchain && ./gen-tc.sh kindle5 && tar -zcvf /sdks/kindle5.tar.gz /home/sdk/x-tools