#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

swipl -s ${THIS_DIR}/family.pl -g run_tests -t halt --quiet
