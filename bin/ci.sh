#!/usr/bin/env bash

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

SOURCE_DIR=${THIS_DIR}/../src

${SOURCE_DIR}/load_test.sh

rm -f ./out/standalone
${SOURCE_DIR}/application/build-standalone.sh

