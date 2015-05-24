#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

swipl --goal=main --toplevel=halt --stand_alone=true --quiet -o ${THIS_DIR}/../out/standalone -c ${THIS_DIR}/standalone.pl

