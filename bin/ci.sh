#!/usr/bin/env bash


THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

rm -f ./out/standalone
${THIS_DIR}/../application/build-standalone.sh


${THIS_DIR}/../myapp/load_test.sh
${THIS_DIR}/../liking/load_test.sh
