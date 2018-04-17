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

function run() {
    for test in "${@}"; do
        test_$test;
    done
}

run "${@}";
