#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

swipl -s ${THIS_DIR}/data_structures.pl      -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/sentences.pl            -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/recursive_comparison.pl -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/recursive_simpler.pl    -g run_tests -t halt --quiet
