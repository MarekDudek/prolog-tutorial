#!/usr/bin/env bash

rm -fr ./out/*

#swipl --goal=go \
#	--stand_alone=true \
#	-o ./out/standalone \
#	-c ./src/standalone.pro

# Hello World program
swipl --goal=main --toplevel=halt --stand_alone=true -o ./out/hello-world -c ./src/hello-world.pro

# Unit tests
swipl --goal=run_tests \
	--toplevel=halt \
	--stand_alone=true \
	-o ./out/tests \
	-c ./src/tests.pl

