#!/usr/bin/env bash

rm -fr ./out/*

#swipl --goal=go \
#	--stand_alone=true \
#	-o ./out/standalone \
#	-c ./src/standalone.pro

# Hello World program
swipl --goal=main --toplevel=halt --stand_alone=true --quiet -o ./out/hello-world -c ./src/hello-world.pro

# Standalone program with command line arguments
swipl --goal=go --toplevel=halt --stand_alone=true --quiet -o ./out/standalone -c ./src/standalone.pro

