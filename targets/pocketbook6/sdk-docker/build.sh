#!/bin/bash

git clone https://github.com/koreader/koxtoolchain.git

cd koxtoolchain && ./gen-tc.sh pocketbook && tar -zcvf /sdks/pocketbook6.tar.gz /home/sdk/x-tools