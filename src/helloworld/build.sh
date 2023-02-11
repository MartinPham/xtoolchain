#!/bin/bash

. /env.sh

rm -rf helloworld

$CXX main.c -o helloworld

$STRIP helloworld

file helloworld
