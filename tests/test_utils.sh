#!/bin/bash

export MYSHELLIB=..;
source ../utils.sh;

function test_SED() {
    SED -i 's/111/222/g' sed_test.txt;
}

function test_not_empty() {
    not_empty "aaa" && echo "not empty";
    not_empty "" || echo "empty";
}

function _processor() {
    echo "Traverse '$1'";
}

function _filter() {
    if [ "`echo "$1" | grep svn`" ]; then
        return 1;
    fi
    return 0;
}

function test_traverse() {
    traverse . _processor;
    traverse ./sed_test.txt _processor;
    traverse ~/bin _processor _filter;
    traverse ~;
}

function run() {
    for test in "${@}"; do
        test_$test;
    done
}

run "${@}";
