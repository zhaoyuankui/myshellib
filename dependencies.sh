#!/bin/bash

function fail() {
    echo "[ERROR] ${@}";
    exit 1;
}

git clone https://github.com/zhaoyuankui/libui-sh.git || fail \
    "Clone dependency 'libui-sh' failed! Run 'dependencies.sh' at '`pwd`' to retry.";

unlink "$0";
