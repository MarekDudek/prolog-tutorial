#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

swipl -s ${THIS_DIR}/last_element.pl       -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/last_but_one.pl       -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/kth_element.pl        -g run_tests -t halt --quiet
swipl -s ${THIS_DIR}/number_of_elements.pl -g run_tests -t halt --quiet
