#!/usr/bin/env bash

rm -fr ./out/*

swipl --goal=go \
	--stand_alone=true \
	-o ./out/standalone \
	-c ./src/standalone.pro

swipl --goal=run_tests \
	--toplevel=halt \
	--stand_alone=true \
	-o ./out/tests \
	-c ./src/tests.pl
