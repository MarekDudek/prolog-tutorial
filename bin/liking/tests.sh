#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname ${SCRIPT}`

SRC_DIR=${SCRIPT_PATH}/../../src/liking

swipl -s ${SRC_DIR}/likings-tests.pl -g run_tests -t halt
