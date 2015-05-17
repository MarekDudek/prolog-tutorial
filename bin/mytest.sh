#!/usr/bin/env bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname ${SCRIPT}`

SRC_DIR=${SCRIPT_PATH}/../src

swipl -s ${SRC_DIR}/../mytest.pl -g run_tests -t halt
