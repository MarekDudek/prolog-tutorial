#!/usr/bin/env bash


SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname ${SCRIPT}`

$SCRIPT_PATH/compile-standalone.sh
$SCRIPT_PATH/run-test.sh

$SCRIPT_PATH/liking/tests.sh

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

${THIS_DIR}/../myapp/test.sh
