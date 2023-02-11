#!/bin/bash

git clone https://github.com/koreader/koxtoolchain.git

cd koxtoolchain && rm -rf /home/sdk/x-tools && ./gen-tc.sh kindlepw2 && tar -zcvf /sdks/kindlepw2.tar.gz /home/sdk/x-tools