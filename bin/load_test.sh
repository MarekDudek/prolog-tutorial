#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

${THIS_DIR}/../src/myapp/load_test.sh
${THIS_DIR}/../src/liking/load_test.sh
