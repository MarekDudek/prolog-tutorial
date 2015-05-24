#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

SOURCE_DIR=${THIS_DIR}/../src

${SOURCE_DIR}/myapp/load_test.sh
${SOURCE_DIR}/liking/load_test.sh
