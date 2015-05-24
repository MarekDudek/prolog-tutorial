#!/usr/bin/env bash


THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

rm -f ./out/standalone
${THIS_DIR}/../src/application/build-standalone.sh


${THIS_DIR}/../src/myapp/load_test.sh
${THIS_DIR}/../src/liking/load_test.sh
