#!/usr/bin/env bash


SCRIPT=$(readlink -f $0)
SCRIPT_PATH=`dirname ${SCRIPT}`

$SCRIPT_PATH/compile-standalone.sh
$SCRIPT_PATH/mytest.sh
$SCRIPT_PATH/run-test.sh

$SCRIPT_PATH/liking/tests.sh
