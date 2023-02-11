#!/bin/bash

git clone https://github.com/koreader/koxtoolchain.git

cd koxtoolchain && ./gen-tc.sh kindlepw2 && tar -zcvf /sdks/kindlepw2.tar.gz /home/sdk/x-tools