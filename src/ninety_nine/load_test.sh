#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

${THIS_DIR}/lists/load_test.sh
