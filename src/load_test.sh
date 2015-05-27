#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

${THIS_DIR}/myapp/load_test.sh
${THIS_DIR}/liking/load_test.sh
${THIS_DIR}/basics/load_test.sh
${THIS_DIR}/book/load_test.sh
