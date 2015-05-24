#!/usr/bin/env bash


SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname ${SCRIPT}`

$SCRIPT_PATH/compile-standalone.sh
$SCRIPT_PATH/run-test.sh


THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

${THIS_DIR}/../myapp/load_test.sh
${THIS_DIR}/../liking/load_test.sh
